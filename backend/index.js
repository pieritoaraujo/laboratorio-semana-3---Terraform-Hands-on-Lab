const http = require('http');
const app = require('./app');

const {ENTORNO, DB_HOST, DB_PORT} = process.env;

function verificarDB(){
    return new Promise((resolve) => {
        const socket = net.connect({ host: DB_HOST, port: Number(DB_PORT), timeout: 2000 });
        socket.on('connect', () => { socket.end(); resolve(true); });
        socket.on('error', () => resolve(false));
        socket.on('timeout', () => { socket.destroy(); resolve(false); });
    });
}

http.createServer(async (req, res) => {
  const bdOk = await verificarBD();
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    entorno: ENTORNO,
    backend: 'ok',
    bd: bdOk ? `conectada (${DB_HOST}:${DB_PORT})` : 'sin conexión'
  }));
}).listen(4002, () => console.log(`Backend ${ENTORNO} escuchando en 4002`));