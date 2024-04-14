'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Task extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Task.init({
    id: {
      type:DataTypes.INTEGER(11),
      allowNull:false,
      autoIncrement:true,
      primaryKey:true
     
    
    },
    taskname: {
      type:DataTypes.STRING,
      allowNull:false
    },
    taskdescription:{
type:DataTypes.STRING,
allowNull:false
    },
     
    priority: 
    {type:DataTypes.STRING,
      allowNull:false

    },
     
    duedate: 
    {type:DataTypes.STRING,
      allowNull:false

    }
    
    
  }, {
    sequelize,
    modelName: 'Tasks',
    tableName:'Tasks'
  });
  return Task;
};