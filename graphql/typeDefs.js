const { gql } = require('apollo-server');

module.exports = gql`
  type User {
    username: String!
    email: String!
    password: String! 
    phone: String ,
    token:String,
    createdAt:String
  }
  type task {
    id: ID!
    taskname: String!
    taskdescription: String
    priority: String! 
    duedate: String ,
     
  }
  input SortInput {
  field: String
  order: String 
}

input FilterInput {
  status: String
  priority: String
  dueDate: String
}
  
  type Query {
    getUser: [User]!
    getAllTask(sortBy: SortInput, filterBy: FilterInput): [task]
    
    login(
        email:String!
        password:String!):User!
  }
  
  type Mutation {
    register(
      username: String!
      email: String!
      password: String!
      
    ): User!
    createtask(
      
        taskname: String!
        taskdescription: String!
        priority: String!
        duedate: String!
    ): task!
    updatetask(
        id: ID!,
        taskname: String!
        taskdescription: String!
        priority: String!
        duedate: String!
    ): task!
    deleteTask(
        id: ID!,
        
    ): task!
  }
`;
