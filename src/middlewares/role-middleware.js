const jwt = require ('jsonwebtoken')

process.env.SECRET_KEY = 'secret'



const verifyRole = (req, res, next) => {
    
    const token = req.headers.authorization.split( ' ' )[1]

    jwt.verify(token, process.env.SECRET_KEY, function( error, decoded ){
        if(error) return res.status(403).send({ error : 'token invalid'})
        console.log(decoded)
        if(decoded.roleId === 1){
            next()

        }else{
            res
        .status(401)
        .send ({ error: 'unathorized', message:'access denied' })

        }
    })
}

    


   

  

module.exports =  verifyRole