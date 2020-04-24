# Delilah Resto API
## Administracion de Pedidos

Esta API permite el manejo y administracion de pedidos, CRUD de productos y gestion de usuarios de un Restaurant.

## Instrucciones para comenzar
Las intrucciones que se daran a continuacion, permitiran correr la API en un entorno local.

## Requisitos

1. Descargar e instalar NodeJS en tu computadora, podras encontrarlo aqui https://nodejs.org/es/
2. Luego de realizar la instalacion podras levantar el servidor desde una consola.

## Instalacion

Luego de obtener la copia local del proyecto:

1. acceder al archivo app.js, encontraras un titulo "Settings" alli podras setear el servidor
2. Acceder al archivo */delilahResto/database/sequelize.js* , encontrar un titulo Settings, alli podras setear la base de datos con sus propiedades.
3. Acceder al archivo *delilahResto/src/middlewares/token-middleware.js*. encontraras el titulo Settings, podras setear lo necesario para generar tokens.

### **Creacion de la base de datos**

Desde la carpeta */delilahResto/database* podrás acceder a un script db.sql que te permitirá generar la base de datos, con datos almacenados en ella.

## Comenzamos

### **Levantar el Servidor**

Prviamente realizado el paso anterior, estas en condiciones de poder levantar el servidor.

**Instrucciones:**

1. desde la carpeta raiz del proyecto, instalamos las dependencias necesarias con el comando:

~~~
npm i
~~~

En el directorio raiz deberia generarse una carpeta llamada ***node_modules***

2. levantar el Servidor:

a. Ejecutando el comando

~~~
npm start
~~~

b. Ejecutando el comando

~~~
node app.js
~~~

3. deberiamos ver un mensaje en la consola:
~~~
server on port 3008
DB Connection has been established successfully.
~~~

## Ponemos en funcionamiento la API
### Operaciones CRUD, podremos acuralizar o eliminar datos, por medio de diferentes endpoints

## USUARIOS

### **Registrar un Usuario**
Metodo HTTP: **POST**
Endpoint: *http://localhost:3008/users/register*
**Request Body:**

~~~
{
    "name": "Jane",
    "completeName": "Jane Doe",
    "email": "jdoe@gmail.com",
    "phone": 3515087164,
    "adress": "Sta Rosa 520",
    "password": "jane123",
    "roleId": 2
}
~~~

**Response:**

~~~
{
    "name": "Jane",
    "completeName": "Jane Doe",
    "email": "jdoe@gmail.com",
    "phone": 3515087164,
    "adress": "Sta Rosa 520",
    "password": "jane123",
    "roleId": 2
}
~~~

**En caso de Error:**

~~~

{
    "error": "user already exist "
}

~~~

#### La siguiente operacion podra realizarla solo un usuario con rol de administrador:

### **Obtener Usuarios:**
Método HTTP: **GET**  
Endpoint: *http://localhost:3008/users*  

**Response:**

~~~
[
    {
        "id": 1,
        "name": "Mike",
        "completeName": "Mike Ross",
        "email": "mross@gmail.com",
        "phone": 351626262,
        "adress": "Sta Rosa 15",
        "password": "mike123",
        "roleId": 2,
        "Role_Id": 2
    },
    {
        "id": 2,
        "name": "Harvey",
        "completeName": "Harvey Specter",
        "email": "hspecter@gmail.com",
        "phone": 351242424,
        "adress": "Gral Paz 25",
        "password": "harvey123",
        "roleId": 1,
        "Role_Id": 1
    },
    {
        "id": 3,
        "name": "Jane",
        "completeName": "Jane Doe",
        "email": "jdoe@gmail.com",
        "phone": 2147483647,
        "adress": "Sta Rosa 520",
        "password": "jane123",
        "roleId": 2,
        "Role_Id": 2
    },
    {
        "id": 4,
        "name": "John",
        "completeName": "John Doe",
        "email": "jodoe@gmail.com",
        "phone": 2147483647,
        "adress": "Sta Rosa 520",
        "password": "john123",
        "roleId": 2,
        "Role_Id": 2
    },
    {
        "id": 5,
        "name": "Juan",
        "completeName": "Juan Perez",
        "email": "jperez@gmail.com",
        "phone": 2147483647,
        "adress": "Sta Rosa 520",
        "password": "jperezn123",
        "roleId": 2,
        "Role_Id": 2
    }
]
~~~

**En Caso de Error:**

~~~
{
    status: '404',
    message: 'users dont found'
}
~~~


## LOGIN

### **Login de Usuario:**
Método HTTP: **POST**  
Endpoint: *http://localhost:3008/user/login*  
**Request body:**
~~~
{
	
    "email": "hspecter@gmail.com",
    "password": "harvey123",
       
}

~~~

**Response:**
~~~
{
    "message": "logged in succesfull",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwibmFtZSI6IkhhcnZleSIsImNvbXBsZXRlTmFtZSI6IkhhcnZleSBTcGVjdGVyIiwiZW1haWwiOiJoc3BlY3RlckBnbWFpbC5jb20iLCJwaG9uZSI6MzUxMjQyNDI0LCJhZHJlc3MiOiJHcmFsIFBheiAyNSIsInBhc3N3b3JkIjoiaGFydmV5MTIzIiwicm9sZUlkIjoxLCJpYXQiOjE1ODc3NDIwNTMsImV4cCI6MTU4Nzc0MzQ5M30.ybT9Bi5rfpfjeneRUmL21t6_1T1rX-u83m1ZGX41DjU"
}

~~~




## PRODUCTOS

#### Las siguientes operaciones podran ser realizadas una vez que el usuario se registro y le fue otorgado un token.

### **Listar productos**
Método HTTP: **GET**  
Endpoint: *http://localhost:3008/products*  

**Response:**
~~~
[
    {
        "Id": 1,
        "name": "Hamburguesa Calsica",
        "price": 200,
        "available": "yes"
    },
    {
        "Id": 2,
        "name": "Hamburguesa Veggie",
        "price": 250,
        "available": "yes"
    }
]
~~~

**En caso de Error:**

~~~
{
    status: '404',
    message: 'products not founds'
}

~~~

### **Encontrar un producto por Id**
Método HTTP: **GET**  
Endpoint: *http://localhost:3008/products/1*  

**Response:**
~~~
    {
        "Id": 1,
        "name": "Hamburguesa Calsica",
        "price": 200,
        "available": "yes"
    }
~~~

**En Caso de Error:**
~~~
{
    "status": "400",
    "message": "the plate doesnt exist"
}
~~~

#### Las siquientes operaciones podran ser realizadas solo por un usuario que tenga Rol de Administrador

### **Cargar un nuevo Producto**
Método HTTP: **POST**  
Endpoint: *http://localhost:3008/products*  

**Request Body:**
~~~
    {
    "name": "Cerveza Patagonia",
    "price": 200,
    "available": "yes"
    }
~~~

**Response:**
~~~
    {
    "name": "Cerveza Patagonia",
    "price": 200,
    "available": "yes"
    }   
~~~


### **Borrar un Producto por Id**
Método HTTP: **DELETE**  
Endpoint: *http://localhost:3008/products/5*  

**Response:**
~~~
    {
    "status": "200",
    "message": "the plate was deleted"
    }  
~~~

### **Modificar un Producto**
Método HTTP: **PUT**  
Endpoint: *http://localhost:3008/products/5* 

**Req Body:**
~~~
    {
    	"name": "Hamburguesa Calsica",
        "price": 300,
        "available": "yes"
    }
 ~~~

 **Response:**
 ~~~
    {
    "status": "200",
    "message": "the plate was Modify"
    }
~~~

## PEDIDOS - DETALLES

### Obtener los Detalles de la Orden:
Método HTTP: **GET**  
Endpoint: *http://localhost:3008/order/detail* 

**Response:**

~~~
[
    {
        "Id": 1,
        "subtotal": 200,
        "Plate_Id": 1,
        "plate": {
            "Id": 1,
            "name": "Hamburguesa Calsica",
            "price": 300,
            "available": "yes"
        }
    },
    {
        "Id": 2,
        "subtotal": 250,
        "Plate_Id": 2,
        "plate": {
            "Id": 2,
            "name": "Hamburguesa Veggie",
            "price": 250,
            "available": "yes"
        }
    }
]
~~~

### Crear un Detalle de Orden:
Método HTTP: **POST**  
Endpoint: *http://localhost:3008/order/detail* 

**Request Body:**

~~~
 {
    	
         "subtotal": 200,
        "Plate_Id": 1
 }
~~~

**Response:**

~~~
{
    "Id": 3,
    "Plate_Id": 1,
    "subtotal": 200
}
~~~

## ORDEN 

### Obtener una Orden:##
Método HTTP: **GET**  
Endpoint: *http://localhost:3008/order* 

**Response:**

~~~
[
    {
        "Id": 1,
        "hour": "15:30:00",
        "Status_Id": 1,
        "Pay_Method_Id": 1,
        "User_Id": 1,
        "status": {
            "Id": 1,
            "status": "Confirmado"
        },
        "pay_method": {
            "Id": 1,
            "method": "Efvo"
        },
        "user": {
            "id": 1,
            "name": "Mike",
            "completeName": "Mike Ross",
            "email": "mross@gmail.com",
            "phone": 351626262,
            "adress": "Sta Rosa 15",
            "password": "mike123",
            "roleId": 2,
            "Role_Id": 2
        },
        "orderDet": [
            {
                "Id": 1,
                "subtotal": 200,
                "Plate_Id": 1,
                "order_has_order_detail": {
                    "Order_Id": 1,
                    "Order_Detail_Order_Detail_Id": 1
                }
            },
            {
                "Id": 2,
                "subtotal": 250,
                "Plate_Id": 2,
                "order_has_order_detail": {
                    "Order_Id": 1,
                    "Order_Detail_Order_Detail_Id": 2
                }
            }
        ]
    },
    {
        "Id": 2,
        "hour": "17:00:00",
        "Status_Id": 2,
        "Pay_Method_Id": 2,
        "User_Id": 2,
        "status": {
            "Id": 2,
            "status": "Preparando"
        },
        "pay_method": {
            "Id": 2,
            "method": "Tarjeta"
        },
        "user": {
            "id": 2,
            "name": "Harvey",
            "completeName": "Harvey Specter",
            "email": "hspecter@gmail.com",
            "phone": 351242424,
            "adress": "Gral Paz 25",
            "password": "harvey123",
            "roleId": 1,
            "Role_Id": 1
        },
        "orderDet": [
            {
                "Id": 1,
                "subtotal": 200,
                "Plate_Id": 1,
                "order_has_order_detail": {
                    "Order_Id": 2,
                    "Order_Detail_Order_Detail_Id": 1
                }
            }
        ]
    }
]
~~~

### Obtener una orden por Id ###

Método HTTP: **GET**  
Endpoint: *http://localhost:3008/order/1* 

**Response:**

~~~
{
    "Id": 1,
    "hour": "15:30:00",
    "Status_Id": 1,
    "Pay_Method_Id": 1,
    "User_Id": 1,
    "status": {
        "Id": 1,
        "status": "Confirmado"
    },
    "pay_method": {
        "Id": 1,
        "method": "Efvo"
    },
    "user": {
        "id": 1,
        "name": "Mike",
        "completeName": "Mike Ross",
        "email": "mross@gmail.com",
        "phone": 351626262,
        "adress": "Sta Rosa 15",
        "password": "mike123",
        "roleId": 2,
        "Role_Id": 2
    },
    "orderDet": [
        {
            "Id": 1,
            "subtotal": 200,
            "Plate_Id": 1,
            "order_has_order_detail": {
                "Order_Id": 1,
                "Order_Detail_Order_Detail_Id": 1
            }
        },
        {
            "Id": 2,
            "subtotal": 250,
            "Plate_Id": 2,
            "order_has_order_detail": {
                "Order_Id": 1,
                "Order_Detail_Order_Detail_Id": 2
            }
        }
    ]
}
~~~

### Crear una Orden nueva ###

Método HTTP: **POST**  
Endpoint: *http://localhost:3008/order* 

**Request Body:**

~~~
{
    "hour": "22:30:00",
    "Status_Id": 1,
    "Pay_Method_Id": 1,
    "User_Id": 3
 }
 ~~~

 **Response:**

 ~~~
 {
    "Id": 3,
    "User_Id": 3,
    "hour": "22:30:00",
    "Status_Id": 1,
    "Pay_Method_Id": 1
}
~~~

### Agregarle un Detalle de Orden a la orden:
Método HTTP: **PUT**  
Endpoint: *http://localhost:3008/order/3/detail*

**Request Body:**
~~~
{
	"detId": 1 
}
~~~

**Response:**
~~~
[
    [
        {
            "Order_Id": 3,
            "Order_Detail_Order_Detail_Id": 1
        }
    ]
]
~~~

#### La siguiente operacion solo puede ser realizada por un usuario con Rol de Administrador ###

### Modificar el estado de una Orden ###
Método HTTP: **PUT**  
Endpoint: *http://localhost:3008/order/3*

**Request Body:**

~~~

{
	"Status_Id": 3
}

~~~

**Response:**

~~~
{
    "status": "200",
    "message": "the Status Order was modified"
}

~~~

## TOKEN AUTORIZATIONS - ROLES AUTORIZATIONS

**Request header:**
~~~
    "key": Authorization
    "value": eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwibmFtZSI6IkhhcnZleSIsImNvbXBsZXRlTmFtZSI6IkhhcnZleSBTcGVjdGVyIiwiZW1haWwiOiJoc3BlY3RlckBnbWFpbC5jb20iLCJwaG9uZSI6MzUxMjQyNDI0LCJhZHJlc3MiOiJHcmFsIFBheiAyNSIsInBhc3N3b3JkIjoiaGFydmV5MTIzIiwicm9sZUlkIjoxLCJpYXQiOjE1ODc3NDU0MTcsImV4cCI6MTU4Nzc0Njg1N30.RMF77Q7djPV3PYVj5nfTdMg-vrLd9MuY3Ish9RkNczA
~~~









 

















