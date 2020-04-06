const sequelize = require ('../../database/sequelize')
const Sequelize = require ('sequelize')

//table model - User -
module.exports = sequelize.define('user', {
    id:{
        field:'User_id',
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
        
    },
    name:{
        field: 'Name',
        type: Sequelize.STRING,
        validate:{
            notEmpty:{
                args: true,
                msg: 'name is required'
            }
        }
    } ,
    completeName: {
        field:'CompleteName',
        type: Sequelize.STRING
    } ,
    email: {
        field:'Email',
        type:Sequelize.STRING
    },
    phone: {
        field: 'Cel',
        type:Sequelize.STRING
    },
    adress:{
        field: 'Adress',
        type:Sequelize.STRING
    },
    password:{
        field: 'Password',
        type:Sequelize.STRING
    },
    roleId:{
        field: 'Role_Id',
        type:Sequelize.INTEGER
    }
  }, {
        timestamps: false ,
        freezeTableName: true 
    
},
)