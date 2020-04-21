const Sequelize = require ('sequelize')


const sequelize = new Sequelize('delilah_resto', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    define: {
      timestamps: false
    }
  });

  //verifying connection  

  sequelize
  .authenticate()
  .then(() => {
    console.log('DB Connection has been established successfully.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });

  module.exports = sequelize