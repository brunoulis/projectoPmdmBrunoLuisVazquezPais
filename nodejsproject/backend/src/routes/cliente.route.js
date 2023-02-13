const {Router} = require('express');
const {consultarClientes, guardarCliente, eliminarCliente,modificarCliente}  = require('../controllers/cliente.controller');
const router = Router();

router.get('/api/clientes', consultarClientes);
router.post('/api/clientes/registro', guardarCliente);
router.delete('/api/clientes/eliminar', eliminarCliente);
router.put('/api/clientes/modificar', modificarCliente);

module.exports = router;