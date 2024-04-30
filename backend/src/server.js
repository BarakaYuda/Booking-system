require('dotenv').config();
const moment = require('moment');
const cors = require('cors');
const express = require('express');
const app = express();
const port = process.env.SERVER_PORT;

app.all('*', (req, res, next)=>{
    const date = moment().format('YYYY-MM-dd MM:mm:ss');
    const method = req.method;
    const path = req.path;
    console.log(`New Request: ${date}\t Method: ${method}\t path: ${path}`);
    next();
} );

app.use(cors('*'));
app.get('/', (req, res) => {
      res.contentType('application/json');
      res.status(200);
      res.send('{"status":"ok"}');
});
app.get('/api/user', (req, res) => {
    res.contentType('application/json');
    res.status(200)
    res.send('{"status":"ok", "message":"USER DATA"}');
});
app.get('*', (req, res) => {
    res.contentType('application/json');
    res.status(404)
    res.send('{"status":"NOT FOUND"}');
});
//sijaelewa
app.listen(port,() => {
    console.log('server started running on port: ', port);
});