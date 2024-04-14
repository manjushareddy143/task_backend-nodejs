'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
        unique:true
      },
      username: {
        type: Sequelize.STRING,
        allowNull:false,
        unique:true
      },
      email: {
        type: Sequelize.STRING,
        allowNull:false,
        unique:true,
        validator:{
          isEmail:{
            args:true,
            msg:'must be valid email adress'
          }
                  }
      },
      phone: {
        type: Sequelize.INTEGER,
        allowNull:true,
        unique:true
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('users');
  }
};