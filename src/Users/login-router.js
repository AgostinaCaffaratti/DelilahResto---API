const express = require ('express')
const router = express.Router()

const cors = require ('cors')
const jwt = require ('jsonwebtoken')


const User = require ('./users-model')
router.use(cors())

process.env.SECRET_KEY = 'secret'



const loginUser = router.post('/user/login', (req, res) => {
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
            res.json({message: 'logged in succesfull', token: token})
        } else{
            res.send('User doesnt exist')
        }
    })
    .catch(err => {
        res.send('error:' + '' + err)
    })
})

module.exports = router, loginUser