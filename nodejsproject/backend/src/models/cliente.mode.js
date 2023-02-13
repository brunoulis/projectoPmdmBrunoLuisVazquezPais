const{ Schema, model} = require('mongoose');
const ClienteSchema = Schema({
    problema: String,
    descripcion: String,
    fecha: String,
    estado: String,
});

module.exports = model('Cliente', ClienteSchema);