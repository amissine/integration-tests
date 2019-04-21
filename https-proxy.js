/*
 * Usage example, 4 terminal windows
 *
 * === terminal 1 ===
 * nc -l localhost 8000
 *
 * === terminal 2 ===
 * nc -l localhost 9000
 *
 * === terminal 3 ===
 * sudo node https-proxy.js /home/alec/process/csr/p.fi.net.key /home/alec/process/csr/p.fi.net.cert
 *
 * === terminal 4 (+) ===
 * wget --no-check-certificate https://hq.fi1.com/.well-known/stellar.toml
 * wget --no-check-certificate https://hq.fi2.com/.well-known/stellar.toml
 *
 * + Prior to usage, add the following two lines to the /etc/hosts :
 * 10.0.0.27 hq.fi1.com
 * 10.0.0.27 hq.fi2.com
 */
const http = require('http')
const https = require('https')
const proxy = require('http-proxy').createProxy({})
const fs = require('fs')
const pkfile = process.argv[2]
const certfile = process.argv[3]
const map = {
  'hq.fi1.com':'http://localhost:8000',
  'hq.fi2.com':'http://localhost:9000'
}

if (process.argv[4] === 'UseHTTPS') {
  https.createServer(
    {
      key: fs.readFileSync(pkfile, 'utf8'),
      cert: fs.readFileSync(certfile, 'utf8')
    },
    (req, res) => proxy.web(req, res, { target: map[req.headers.host] })
  ).listen(443)
}
else {
  http.createServer(
    (req, res) => proxy.web(req, res, { target: map[req.headers.host] })
  ).listen(80)
}
