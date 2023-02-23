const express = require('express');
const morgan = require('morgan');
const cors = require('cors');

const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use(cors());

app.use(morgan('dev'));
app.use(require('./routes/cliente.route'));

module.exports= {app};