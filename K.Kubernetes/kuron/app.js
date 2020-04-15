const http = require('http');
const os = require('os');

console.log("Démarrage du serveur Kuron...");

var handler = function(request, response) {
  console.log("Requête reçue de " + request.connection.remoteAddress);
  response.writeHead(200);
  response.end("Tu as touché " + os.hostname() + "\n");
};

var www = http.createServer(handler);
www.listen(8080);
