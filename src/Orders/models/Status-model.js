const sequelize = require ('./../../../database/sequelize')
const Sequelize = require ('sequelize')

//table model - Status -
module.exports = sequelize.define('status', {
    Id:{
        field:'Status_Id',
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
        
    },
    status:{
        field: 'Status',
        type: Sequelize.STRING,
        validate:{
            notEmpty:{
                args: true,
                msg: 'status is required'
            }
        }
    } ,
    
  }, {
        timestamps: false,
        freezeTableName: true
    
})