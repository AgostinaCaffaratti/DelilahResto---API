const express = require ('express')
const router = express.Router()

const cors = require ('cors')
const jwt = require ('jsonwebtoken')
const bcrypt = require ('bcrypt')

const User = require ('./users-model')
router.use(cors())

process.env.SECRET_KEY = 'secret'


router.post('/users', (req,res) => {
    const userData = {
        name: req.body.name,
        completeName: req.body.completeName,
        email: req.body.email,
        phone: req.body.email,
        adress: req.body.adress,
        password: req.body.pasword,
        roleId: req.body.roleId
    }

    User.findOne({
        where:{
            email: req.body.email
        }

    })
    .then(user => {
        if(!user){
            const hash = bcrypt.hashSync(userData.password, 10 )
            userData.password = hash
            User.create(userData)
             .then( user =>{
                 let token = jwt.sign(user.dataValues, process.env.SECRET_KEY, {

                     expiresIn: 1440
                 })
                 res.json({ token: token })
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

router.post('/user/login', (req, res) => {
    User.findOne({
        where: {
            email: req.body.email,
            password: req.body.password
        }

    })
    .then(user => {
        if(user) {
        
            let token = jwt.sign(user.dataValues, process.env.SECRET_KEY, {
                expiresIn: 1440
            })
            res.json({ token: token})
        } else{
            res.send('User doesnt exist')
        }
    })
    .catch(err => {
        res.send('error:' + '' + err)
    })
})



module.exports = router