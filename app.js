const express = require ('express')
const app = express ()
const Sequelize = require ('sequelize')




// Settings
app.set('port', process.env.PORT || 3008)

// Middlewares
app.use(express.json())


//Server
app.listen(app.get ('port'), () => {
    console.log('server on port' ,app.get('port'))
})

//   //verifying connection  

//   sequelize
//   .authenticate()
//   .then(() => {
//     console.log('DB Connection has been established successfully.');
//   })
//   .catch(err => {
//     console.error('Unable to connect to the database:', err);
//   });


  //Routes
app.use(require ('./products/product-routes'))


  




