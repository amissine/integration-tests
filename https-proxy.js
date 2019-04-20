/*
 * Usage example
 *
 * sudo node https-proxy.js /home/alec/process/csr/compliance.fi1.com.key /home/alec/process/csr/compliance.fi1.com.cert
 *
 */
const https = require('https')
const proxy = require('http-proxy').createProxy({})
const fs = require('fs')
const pkfile = process.argv[2]
const certfile = process.argv[3]
const map = {
  'compliance.fi1.com':'http://localhost:8001',
  'compliance.fi2.com':'http://localhost:8002'
}

https.createServer(
  {
    key: fs.readFileSync(pkfile, 'utf8'),
    cert: fs.readFileSync(certfile, 'utf8')
  },
  target
).listen(443)

function target (req, res) {
  const host = req.headers.host
  console.log('host', host)
  proxy.web(req, res, { target: map[host] })
}
