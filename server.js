const http= require('http');
const express = require('express');
const app = express();

//recursos(permite que el css conecte con html)
app.use(express.static(__dirname+'/'));

//Enrutamiento
app.get('/',(req,res) => {
    res.sendFile("/home/ubuntu/landing/H221S2_44")
});


app.listen(3000);
console.log('server on port 3000');
