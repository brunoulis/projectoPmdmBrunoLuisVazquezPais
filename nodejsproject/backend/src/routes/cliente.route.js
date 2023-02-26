const {Router} = require('express');
const {consultarClientes, guardarCliente, eliminarCliente,modificarCliente}  = require('../controllers/cliente.controller');
const router = Router();

router.get('/api/clientes', consultarClientes);
router.post('/api/clientes/add', guardarCliente);
router.delete('/api/clientes/delete', eliminarCliente);
router.put('/api/clientes/mod', modificarCliente);

module.exports = {router};