import 'package:flutter/material.dart';
import 'package:projectodart/modelos/cliente.model.dart';
import 'package:projectodart/pantallas/textbox.dart';
import 'package:projectodart/peticiones/cliente.peticion.dart';

class RegisterClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterCliente();
}
  
class _RegisterCliente extends State<RegisterClient>{

  late TextEditingController controllerNombre;
  late TextEditingController controllerProblema;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerFecha;
  late TextEditingController controllerEstado;
  late TextEditingController controllerTelefono;

  @override
  void initState(){
    
    controllerNombre = new TextEditingController();
    controllerProblema = new TextEditingController();
    controllerDescripcion =  new TextEditingController();
    controllerFecha = new TextEditingController();
    controllerEstado = new TextEditingController();
    controllerTelefono = new TextEditingController();
    super.initState();
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Cliente'),
      ),
      body: ListView(
        children: [
          TextBox(controllerNombre, 'Nombre'),
          TextBox(controllerProblema, 'Problema'),
          TextBox(controllerDescripcion, 'Descripcion'),
          TextBox(controllerFecha, 'Fecha'),
          TextBox(controllerEstado, 'Estado'),
          TextBox(controllerTelefono, 'Telefono'),
          ElevatedButton(
            onPressed: (){
              String nombre = controllerNombre.text;
              String problema = controllerProblema.text;
              String descripcion = controllerDescripcion.text;
              String fecha = controllerFecha.text;
              String estado = controllerEstado.text;
              String telefono = controllerTelefono.text;

              if(nombre.isNotEmpty && problema.isNotEmpty  && descripcion.isNotEmpty  && fecha.isNotEmpty  && estado.isNotEmpty  && telefono.isNotEmpty ){
                
                Client client = Client.fromData(nombre, problema, descripcion, fecha, estado, telefono);
                addClient(client).then((value) {
                  if(value.id!=''){
                    Navigator.pop(context, value);
                  }
                });
              }
            },
            child: Text('Guardar'),
          )
        ],
        

      ),

    );


  }



}