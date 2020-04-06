
const express = require ('express')
const Plates = require ('./product-model')

const router = express.Router()



  //endpoints:

  // /products
  router.get('/products', (req, res, err) => {
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

  

router.post('/products', (req, res) =>{
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


//products id

router.get('/products/:id', (req, res,) => {
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

router.delete('/products/:id', (req, res) => {
  Plates.destroy({
    where:{
      id: req.params.id
    }
  }).then( () => res.send('succes'))
})



router.put('/products/:id', (req,res) => {
  Plates.update(
    { 
      nombre: req.body.nombre,
      price: req.body.price,
      available: req.body.available

  },
  {
    where:
    {
      id: req.params.id
    }
  })
  .then( () => res.send('success'))

})



module.exports = router


