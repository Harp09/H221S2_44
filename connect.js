//De acuerdo a lo que hemos instalado
var express = require("express");
var mysql = require("mysql");
var app = express();
var cors = require("cors");
 
app.use(express.json());
app.use(cors());
app.use(express.static(__dirname + '/'));
 
//Verficar si esta informacion es correcta de acuerdo a tu localhost
var conexion = mysql.createConnection({
  host: "52.73.155.169",
  user: "hebert",
  password: "12345",
  database: "db_landig_page"
});
 
//Verificar si la conexion a base de datos fue exitosa ,de lo contrario te devolvera un error
conexion.connect(function (error) {
  if (error) {
    console.log(error)
    throw error;
  } else {
    console.log("Conexión exitosa");
  }
});
const puerto = process.env.PUERTO || 3000;
 
app.listen(puerto, function () {
  console.log("Servidor funcionando en puerto: " + puerto);
});
 
//El contrato entre el servidor y el cliente para permitir la inserción de registros en la tabla
app.post("/api/contactanos", (req, res) => {
    console.log('datos : ', req.body);
    let data = {
        nomcon: req.body.nombre,
        corrcon: req.body.correo,
        asucon: req.body.asunto,
        descon: req.body.descripcion
    };
    //Insertamos los datos en tabla creada CONTACTANOS
    let sql = "INSERT INTO contactanos SET ?";
    conexion.query(sql, data, function (error, results) {
    if (error) {
        throw error;
    } else {
        console.log(data);
        res.send(data);
    }
    });
  });
