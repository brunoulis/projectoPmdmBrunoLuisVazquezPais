const clienteModel = require('../models/cliente.model');

class ClienteService{
    ClienteService() {}
    async consultarClientes(){
        try{
            return await clienteModel.find();
        }catch(error){
            return error;
        }
    }

    async guardarCliente(cliente = new clienteModel()){
        try{
            var clienteGuardado;
            await clienteModel.create(cliente).then((value)=>{
                clienteGuardado = value;
            }); 
            return clienteGuardado;
        }catch(error){
            console.log(error);
        }
    }

    async eliminarCliente(id){
        try {
            const clienteEliminado = await clienteModel.findOneAndRemove({_id: id});
            return clienteEliminado;
        } catch (error) {
            console.log(error);
        }
    }
    

    async modificarCliente(newCliente){
        try {
            const clienteModificado = await clienteModel.findById(newCliente._id);
            clienteModificado.nombre = newCliente.nombre;
            clienteModificado.problema = newCliente.problema;
            clienteModificado.descripcion = newCliente.descripcion;
            clienteModificado.fecha = newCliente.fecha;
            clienteModificado.estado = newCliente.estado;
            clienteModificado.telefono = newCliente.telefono;
    
            await clienteModificado.save();
            return clienteModificado;
        } catch (error) {
            console.log(error);
        }
    }

}

module.exports = new ClienteService();