const sequelize = require ('./../../database/sequelize')
const Sequelize = require ('sequelize')

module.exports = sequelize.define('orderhasdetail',{
    


    
        timestamps: false,
        freezeTableName: true,
        underscored: true
        
    
}
    
)