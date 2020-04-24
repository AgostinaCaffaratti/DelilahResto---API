const express = require ('express')
const router = express.Router()
const  User = require ('./Users-model')
const  Role = require ('./Role-model')

const cors = require ('cors')




router.use(cors())

process.env.SECRET_KEY = 'secret'

Role.hasMany(User,{
    foreignKey: 'Role_Id'
})

// User.belongsTo( Role,{
//     foreignKey: 'User_Id'
// } )




const getUsers = router.get('/users', (req, res, err) => {
    User.findAll(     )

    .then((users) => {
        if (users){
          res.json(users)          
        } else {
          res.status(400).json({
            status: '404',
            message: 'users dont found'
          })
        }

    })
  })

 




const register = router.post('/users/register', (req,res) => {
    const userData = {
        name: req.body.name,
        completeName: req.body.completeName,
        email: req.body.email,
        phone: req.body.phone,
        adress: req.body.adress,
        password: req.body.password, 
        roleId: req.body.roleId  
          
    }

    User.findOne({
        where:{
            email: req.body.email
        }

    })
    .then(user => {
        if(!user){
            User.create(userData)
             .then( user =>{
                 res.json (user)
                 
             })
             .catch( err => {
                 res.send ('error:' + err )
             })
        } else {
            res.json( { error : 'user already exist '})
        }
    })
    .catch(err => {
        res.send( 'error:' + err )
    })
})





module.exports = router, getUsers, register
