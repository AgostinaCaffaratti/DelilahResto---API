const jwt = require ('jsonwebtoken')


//Settings
process.env.SECRET_KEY = 'secret'

const verifyToken = (req, res, next) => {
    if(req.headers.authorization){
    const token = req.headers.authorization.split( ' ' )[1]
    console.log(token)
    
    
    
    try {
        jwt.verify(token, process.env.SECRET_KEY)
       
        next()
    } catch (error) {
        res
        .status(401)
        .send ({ error: 'unathorized', message:'token verification failed' })
        
    }
    
}else{
    res
        .status(401)
        .send ({ error: 'unathorized', message:'you need a token to access' })
        

}
}
module.exports = verifyToken