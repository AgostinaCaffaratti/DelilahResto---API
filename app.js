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



  //Routes
  //products
app.use(require ('./src/products/product-router'))

  //users
app.use(require('./src/Users/User-router'))




  




