const sequelize = require ('./../../../database/sequelize')
const Sequelize = require ('sequelize')

//table model - Status -
module.exports = sequelize.define('pay_method', {
    Id:{
        field:'Pay_Method_Id',
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
        
    },
    method:{
        field: 'Pay-Method',
        type: Sequelize.INTEGER,
        validate:{
            notEmpty:{
                args: true,
                msg: 'method is required'
            }
        }
    } ,
    
  }, {
        timestamps: false,
        freezeTableName: true
    
})