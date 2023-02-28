const { Schema, model } = require('mongoose');
const clienteSchema = Schema({
    nombre: String,
    problema: String,
    descripcion: String,
    fecha: String,
    estado: String,
    telefono: String
});

module.exports = model('Cliente', clienteSchema);