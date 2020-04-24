const express = require ('express')
const OrderDetail = require ('./models/OrderDetail-model')
const Plates = require ('./../products/Product-model')
const Order = require ('./models/Order-model')
const Status = require ('./models/Status-model')
const PayMethod = require ('./models/PayMethod-model')
const User = require ('./../Users/Users-model')
const OrderHasDetail = require ('./orderhasdetail-model')

const router = express.Router()

OrderDetail.belongsTo(Plates, {
    foreignKey: 'Plate_Id'
})



const getOrderDetail = router.get('/order/detail', (req, res, err) => {
    OrderDetail.findAll({
        include: [Plates]
    })
    .then((orderDetail) => {
        if (orderDetail){
          res.json(orderDetail)          
        } else {
          res.status(400).json({
            status: '404',
            message: 'OrderDetails not founds'
          })
        }

    })
  })

  const newOrderDetail = router.post('/order/detail', (req, res) =>{
    OrderDetail.create({
      Plate_Id: req.body.Plate_Id,
      
      subtotal: req.body.subtotal,

    })
    .then((orderDetail) =>{
      res.json(orderDetail)
    }, (errors) => {
      res.json(errors)
    })
  
  })

  Order.belongsTo(Status, {
    foreignKey: 'Status_Id'
  })

  Status.hasMany(Order,{
    foreignKey: 'Status_Id'
  })
  
  Order.belongsTo(PayMethod, {
    foreignKey: 'Pay_Method_Id'
  })
  PayMethod.hasMany(Order, {
    foreignKey: 'Pay_Method_Id'
  })

  Order.belongsTo(User, {
    foreignKey: 'User_Id'
  })
  User.hasMany(Order, {
    foreignKey: 'User_Id'
  })
  
  
  Order.belongsToMany(OrderDetail, {as: 'orderDet', through: 'order_has_order_detail', foreignKey: 'Order_Id'})
  OrderDetail.belongsToMany(Order, { as: 'orderDet' ,through: 'order_has_order_detail', foreignKey: 'Order_Detail_Order_Detail_Id'})
  



  const getOrder = router.get('/order', (req, res, err) => {
    Order.findAll({
        include: [ {all: true}]
    })
    .then((order) => {
        if (order){
          res.json(order)          
        } else {
          res.status(400).json({
            status: '404',
            message: 'Order not founds'
          })
        }

    })
  })

  const getOrderById = router.get('/order/:id', (req, res,) => {
    let { id } = req.params
    Order.findByPk(id,{
      include: [{ all: true }]
    })
      .then((order) => {
      if (order){
        res.json(order)          
      } else {
        res.status(400).json({
          status: '400',
          message: 'the order doesnt exist'
        })
      }
    })

  })

  const modifyOrder = router.put('/order/:id', (req,res) => {
    Order.update(
      { 
        Status_Id: req.body.Status_Id,
        
  
    },
    {
      where:
      {
        id: req.params.id
      }
    })
    .then( () => res.status(200).json({
      status: '200',
      message: 'the Status Order was modified'
    }))
  })


  const newOrder = router.post('/order', (req, res) =>{
    Order.create({
      User_Id: req.body.User_Id,
      hour: req.body.hour,
      Status_Id: req.body.Status_Id,
      Pay_Method_Id: req.body.Pay_Method_Id,
      Total: req.body.Total

    })
    
      .then((order) => {
      res.json(order)
      
      })

    , (errors) => {
      res.json(errors)
    }

  })

  const addDetailToOrder = router.put('/order/:id/detail', (req,res,next) =>{
    Order.findByPk(req.params.id)
    .then(order => {
      return order.setOrderDet(req.body.detId)

    })
    .then (res.send.bind(res))
    .catch(next)
  })

  



  

  
  

  

  module.exports = getOrderDetail, newOrderDetail, getOrder, getOrderById, modifyOrder, newOrder, addDetailToOrder