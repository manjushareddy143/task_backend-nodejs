const { User, Tasks } = require('../models'); 
const { UserInputError, AuthenticationError, ApolloError } = require('apollo-server');
const jwt = require('jsonwebtoken');
const { JWT_SECRET } = require('../config/env.json');
const bcrypt = require('bcryptjs');
const { Op } = require('sequelize');
const authenticateToken=require('../middleware/authenticateToken');
 
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;  
const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/; 
module.exports = {
    Query: {
        getUser: async (_, __, context) => {
        
        
              try {
                
                const decodedToken = authenticateToken(context.req.headers.authorization);
                
                const user = decodedToken;
                console.log(user);  
                 
                
                const users = await User.findAll();
                return users || new ApolloError('User not found');
              } catch (err) {
                console.error('Error retrieving user:', err);
                throw new AuthenticationError('Invalid or expired token');
              }
              
          },
          getAllTask: async (_, { sortBy, filterBy }, context) => {
            try {
                const decodedToken = authenticateToken(context.req.headers.authorization);
                const user = decodedToken;
                console.log(user);

                 
                const whereClause = {};
                if (filterBy) {
                    if (filterBy.status) {
                        whereClause.status = filterBy.status;
                    }
                    if (filterBy.priority) {
                        whereClause.priority = filterBy.priority;
                    }
                    if (filterBy.dueDate) {
                        whereClause.dueDate = {
                            [Op.lte]: new Date(filterBy.dueDate)  
                        };
                    }
                }

            
                const orderClause = [];
                if (sortBy && sortBy.field) {
                    orderClause.push([sortBy.field, sortBy.order]); 
                }

                 
                let tasks = await Tasks.findAll({
                    where: whereClause,
                    order: orderClause
                });

                return tasks || [];
            } catch (err) {
                console.error('Error retrieving tasks:', err);
                throw new ApolloError('Failed to retrieve tasks');
            }
        },

      
    

           
        login: async (_, { email, password }) => {
            if (email.trim() === '' || password.trim() === '') {
                throw new UserInputError('Email and password must not be empty');
            }

            const user = await User.findOne({ where: { email: email.toLowerCase() } });
            if (!user) {
                throw new UserInputError('User not found');
            }

            const correctPassword = await bcrypt.compare(password, user.password);
            if (!correctPassword) {
                throw new UserInputError('Incorrect password');
            }

            const token = jwt.sign({ userId: user.id }, JWT_SECRET, { expiresIn: '1h' });
            return { ...user.toJSON(), token };
        },
    },
     
          Mutation :{
            register: async (_, { username, email, password }) => {
              
               
             
                
                if (!emailRegex.test(email)) {
                    throw new UserInputError('Invalid email format');
                }
        
               
                if (!passwordRegex.test(password)) {
                    throw new UserInputError('Password does not meet criteria. It must contain at least 8 characters, including an uppercase letter, a lowercase letter, a number, and a special character.');
                }
        
               
                const hashedPassword = await bcrypt.hash(password, 10);
                try {
                    const newUser = await User.create({
                        username,
                        email: email.toLowerCase(),
                        password: hashedPassword
                    });
                    return newUser;
                } catch (err) {
                    console.error('Registration error:', err);
                    throw new UserInputError('Registration failed', { errors: err });
                }
            },
        
       
        
        createtask: async (_, { taskname, taskdescription, priority, duedate }, context) => {
            
    
            
            try {
                const decodedToken = authenticateToken(context.req.headers.authorization);
                
                const user = decodedToken;
                console.log(user);  
                const newTask = await Tasks.create({ 
                    taskname, 
                    taskdescription, 
                    priority, 
                    duedate,
                    UserId: user.id 
                });
                return newTask;
            } catch (err) {
                console.error('Task creation failed:', err);
                throw new ApolloError('Failed to create task');
            }
        },
        updatetask: async (_, { id, taskname, taskdescription, priority, duedate },context) => {
            try {
                const decodedToken = authenticateToken(context.req.headers.authorization);
                
                const user = decodedToken;
                console.log(user);  
                const task = await Tasks.findByPk(id);
                if (!task) {
                    throw new ApolloError('Task not found');
                }

                await task.update({ taskname, taskdescription, priority, duedate });
                return task;
            } catch (err) {
                console.error('Update task failed:', err);
                throw new ApolloError('Failed to update task');
            }
        },
        deleteTask: async (_, { id }) => {
            try {
                const task = await Tasks.findByPk(id);
                if (!task) {
                    throw new ApolloError('Task not found');
                }

                await task.destroy();
                return task;
            } catch (err) {
                console.error('Delete task failed:', err);
                throw new ApolloError('Failed to delete task');
            }
        },
    },
};
