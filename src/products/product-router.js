
const express = require ('express')
const Plates = require ('./product-model')


const router = express.Router()



  //endpoints:

  // /products
  const getProducts = router.get('/products', (req, res, err) => {
    Plates.findAll()
    .then((plates) => {
        if (plates){
          res.json(plates)          
        } else {
          res.status(400).json({
            status: '404',
            message: 'products not founds'
          })
        }

    })
  })

  
  //products id
  
const getProductById = router.get('/products/:id', (req, res,) => {
    let { id } = req.params
    Plates.findByPk(id).then((plate) => {
      if (plate){
        res.json(plate)          
      } else {
        res.status(400).json({
          status: '400',
          message: 'the plate doesnt exist'
        })
      }
    })

  })

  




const newProduct = router.post('/products', (req, res) =>{
  Plates.create({
    name: req.body.name,
    price: req.body.price,
    available: req.body.available
  })
  .then((plates) =>{
    res.json(plates)
  }, (errors) => {
    res.json(errors)
  })

})




const deleteProduct = router.delete('/products/:id', (req, res) => {
  let {id} = req.params
  Plates.findByPk(id).then((plates) =>{
    plates.destroy().then(() => {
      res.status(204).json({
        
          status: '204',
          message: 'the plate has been deleted'
        })
      
    })
  } )
})



const modifyProduct = router.put('/products/:id', (req,res) => {
  Plates.update(
    { 
      nombre: req.body.nombre,
      price: req.body.price,
      available: req.body.available

  },
  {
    where:
    {
      Plate_id: req.params.id
    }
  })
  .then( () => res.send('success'))

})



module.exports = router, getProducts, getProductById, newProduct, modifyProduct, deleteProduct
