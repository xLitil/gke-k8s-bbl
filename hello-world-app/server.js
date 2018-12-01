const express = require('express')
const os = require('os');

const PORT = 8080
const app = express()

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
