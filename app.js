const express = require ('express')
const app = express ()

const { getUsers, register } = require ('./src/Users/User-router')
const { getProducts, newProduct, getProductById, deleteProduct, modifyProduct } = require ('./src/products/product-router' )
const { loginUser } = require ('./src/Users/login-router')
const { verifyRole } = require ('./src/middlewares/role-middleware')
const { verifyToken } = require ('./src/middlewares/token-middleware')
const { getOrderDetail, newOrderDetail, getOrder, getOrderbyId, modifyOrder } = require ('./src/Orders/Order-router')






// Settings
app.set('port', process.env.PORT || 3008)

//Server
app.listen(app.get ('port'), () => {
    console.log('server on port' ,app.get('port'))
})



// Middlewares
app.use(express.json())

app.use(require('./src/Orders/Order-router', getOrderDetail))
app.use(require('./src/Orders/Order-router', newOrderDetail))
app.use(require('./src/Orders/Order-router', getOrder))
app.use(require('./src/Orders/Order-router', getOrderbyId ))
app.use(require('./src/Orders/Order-router', modifyOrder ))


//users register 
app.use(require('./src/Users/User-router',register))

//login
app.use(require('./src/Users/login-router', loginUser ))

//midleware
app.use(require ('./src/middlewares/token-middleware', verifyToken))

//products
app.use(require ('./src/products/product-router', getProducts,  getProductById,  ))





app.use(require ('./src/middlewares/role-middleware', verifyRole))
app.use(require ('./src/products/product-router', newProduct, deleteProduct, modifyProduct  ))
app.use(require('./src/Users/User-router',getUsers))








  




