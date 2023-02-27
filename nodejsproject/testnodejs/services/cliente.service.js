const clienteModel = require('../models/cliente.model');


class ClienteService {
    ClienteService() {}

    async consultarClientes() {
        try {
            return await clienteModel.find();
        }catch (error) {
            throw error;
        }



    }


}