const express = require('express')
var morgan = require('morgan')
var path = require('path')
var rfs = require('rotating-file-stream')
const os = require('os');

const PORT = 8080
const app = express()

// create a rotating write stream
var accessLogStream = rfs('access.log', {
  path: path.join(__dirname, 'log'),
  maxSize: '1M',
  maxFiles: 2
})
app.use(morgan('combined', { stream: accessLogStream }));

app.use(express.static('public'));

app.get('/host', (req, res) => {
    res.send({
      "hostname": `${os.hostname()}`,
      "env": {
        "JUMBOTRON_COLOR": process.env['JUMBOTRON_COLOR'],
        "CURRENT_ENV": process.env['CURRENT_ENV']
      }
    })
})



app.listen(PORT)
console.log(`Running on http://localhost:${PORT}`)
