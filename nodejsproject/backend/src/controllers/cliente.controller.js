const ClienteService = require('../services/cliente.service');


const consultarClientes = async (req, res) => {
    res.json({clientes: await ClienteService.consultarClientes()});
}

module.exports = {consultarClientes};