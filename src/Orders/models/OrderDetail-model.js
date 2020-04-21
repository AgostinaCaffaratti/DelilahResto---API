const sequelize = require ('./../../../database/sequelize')
const Sequelize = require ('sequelize')

//table model - Detail Order -
module.exports = sequelize.define('order_detail', {
    Id:{
        field:'Order_Detail_Id',
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
        
    },
   
  
    subtotal:{
        field:'Subtotal',
        type:Sequelize.FLOAT
    }
  }, {
        timestamps: false,
        freezeTableName: true
    
})