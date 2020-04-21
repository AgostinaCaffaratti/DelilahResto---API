const sequelize = require ('./../../database/sequelize')
const Sequelize = require ('sequelize')

//table model - Detail Order -
module.exports = sequelize.define('plates', {
    Id:{
        field:'Plate_id',
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
        
    },
    name:{
        field: 'Name',
        type: Sequelize.INTEGER,
        validate:{
            notEmpty:{
                args: true,
                msg: 'name is required'
            }
        }
    } ,
    price: {
        field:'Price',
        type: Sequelize.FLOAT
    } ,
    available:{
        field:'available',
        type:Sequelize.BOOLEAN
    }
  }, {
        timestamps: false  
    
})


