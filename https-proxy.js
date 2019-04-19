const httpProxy = require('http-proxy')
const fs = require('fs')
const pkfile = process.argv[2]
const certfile = process.argv[3]

console.log('  pk file :', pkfile)
console.log('cert file :', certfile)

httpProxy.createServer({
  target: {
    host: 'localhost',
    port: 8001
  },
  ssl: {
    key: fs.readFileSync(pkfile, 'utf8'),
    cert: fs.readFileSync(certfile, 'utf8')
  }
}).listen(443)
