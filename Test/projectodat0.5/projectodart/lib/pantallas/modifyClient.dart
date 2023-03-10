import 'package:flutter/material.dart';
import 'package:projectodart/modelos/cliente.model.dart';
import 'package:projectodart/pantallas/textbox.dart';

import '../peticiones/cliente.peticion.dart';

class ModifyClient extends StatefulWidget {
  final Client _client;
  ModifyClient(this._client);
  @override
  State<StatefulWidget> createState() => _ModifyClient();
}

class _ModifyClient extends State<ModifyClient>{

  late TextEditingController controllerNombre;
  late TextEditingController controllerProblema;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerFecha;
  late TextEditingController controllerEstado;
  late TextEditingController controllerTelefono;
  late String id;

  @override void initState() {
    // TODO: implement initState
    Client client = widget._client;
    id = client.id;
    controllerNombre = new TextEditingController(text: client.nombre);
    controllerProblema = new TextEditingController(text: client.problema);
    controllerDescripcion =  new TextEditingController(text: client.descripcion);
    controllerFecha = new TextEditingController(text: client.fecha);
    controllerEstado = new TextEditingController(text: client.estado);
    controllerTelefono = new TextEditingController(text: client.telefono);
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Cliente'),
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
                
                Client client = Client(id,nombre, problema, descripcion, fecha, estado, telefono);
                updateClient(client).then((value) {
                  if(value.id!=''){
                    Navigator.pop(context, value);
                  }
                });
              }
            },
            child: Text('Actualizar'),
          )
        ],


      ),
      

    );
  }


}