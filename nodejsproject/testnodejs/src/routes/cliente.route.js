const {Router} = require('express');
const {consultarClientes, guardarCliente} = require('../controllers/cliente.controller');
const router = Router();


router.get('/api/clientes', consultarClientes);
router.post('/api/clientes', guardarCliente);

module.exports = router;