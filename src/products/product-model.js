const sequelize = require ('../../database/sequelize')
const Sequelize = require ('sequelize')

//table model - plates -
module.exports = sequelize.define('plates', {
    id:{
        field:'Plate_id',
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
    price: {
        field:'price',
        type: Sequelize.FLOAT
    } ,
    available:{
        field:'available',
        type:Sequelize.BOOLEAN
    }
  }, {
        timestamps: false  
    
})