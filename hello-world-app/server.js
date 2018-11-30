const express = require('express')
const os = require('os');

const PORT = 8080
const app = express()

app.use(express.static('public'));

app.get('/host', (req, res) => {
    res.send({
      hostname: `${os.hostname()}`
    })
})
app.listen(PORT)
console.log(`Running on http://localhost:${PORT}`)
