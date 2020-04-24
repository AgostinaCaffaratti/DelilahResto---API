const sequelize = require ('./../../../database/sequelize')
const Sequelize = require ('sequelize')

//table model - Order -
module.exports = sequelize.define('order_', {
    Id:{
        field:'Id',
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
        
    },
    
    
    
    hour: {
        field: 'Hour',
        type: Sequelize.TIME,
        validate:{
            notEmpty:{
                args: true,
                msg: 'hour is required'
            }
        }      
    },
   

    
   
  }, {
        timestamps: false,
        freezeTableName: true,
        
    
})