var express = require('express');
  

var app = express();


app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/'));

app.get('/', function (req, res) {
	res.sendFile(__dirname + "/index.html");
});

app.get('/login', function (req, res) {
	res.sendFile(__dirname + "/login.html");
});

const puerto = process.env.PUERTO || 3000;

app.listen(puerto, function () {
  console.log("Servidor funcionando en puerto: " + puerto);
});

//Recursos
app.use(express.static(__dirname+'/'));






var mysql = require("mysql");

var cors = require("cors");

app.use(express.json());
app.use(cors());
 
//Verficar si esta informacion es correcta de acuerdo a tu localhost
var conexion = mysql.createConnection({
  host: "44.212.135.107",
  user: "hebert",
  password: "12345",
  database: "formulario",
});
 
//Verificar si la conexion a base de datos fue exitosa ,de lo contrario te devolvera un error
conexion.connect(function (error) {
    if (error) {
      throw error;
    } else {
      console.log("Conexión exitosa");
    }
  });

  

app.post("/api/pedido", (req, res) => {
	let data = {
    	userped: req.body.USERPED,
    	emausped: req.body.EMAUSPED,
    	celusped: req.body.CELUSPED,
    	foodped: req.body.FOODPED,
    	msgped: req.body.MSGPED
	};
	let sql = "INSERT INTO PEDIDO SET ?";
	conexion.query(sql, data, function (error, results) {
  	if (error) {
    	throw error;
  	} else {
    	console.log(data);
    	res.send(data);
  	}
	});
  });