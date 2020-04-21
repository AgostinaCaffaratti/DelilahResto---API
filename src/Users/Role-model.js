const sequelize = require ('../../database/sequelize')
const Sequelize = require ('sequelize')

module.exports = sequelize.define('roles', {
    id:{
        field:'Role_Id',
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
        
    },
    category:{
        field: 'Category',
        type: Sequelize.STRING,
        validate:{
            notEmpty:{
                args: true,
                msg: 'category is required'
            }
        }
    } 
  }, {
        timestamps: false ,
        freezeTableName: true 
    
},
)