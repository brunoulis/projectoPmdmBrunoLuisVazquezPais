const ClienteService = require('../services/cliente.service');


const consultarClientes = async (req, res) => {
    res.json({clientes: await ClienteService.consultarClientes()});
}

const guardarCliente = async (req, res) => {
    console.log(req.body);
    res.json({cliente: await ClienteService.guardarCliente(req.body)});

}

module.exports = {consultarClientes,guardarCliente};