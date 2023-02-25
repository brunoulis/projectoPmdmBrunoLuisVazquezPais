import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectodart/modelos/cliente.model.dart';
import 'package:projectodart/pantallas/textbox.dart';
import 'package:projectodart/peticiones/cliente.peticion.dart';
import 'package:flutter/services.dart';

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
  late DateFormat dateFormat; // Agregar una variable dateFormat para dar formato a la fecha

  @override void initState() {
    // TODO: implement initState
    Client client = widget._client;
    id = client.id;
    controllerNombre = new TextEditingController(text: client.nombre);
    controllerProblema = new TextEditingController(text: client.problema);
    controllerDescripcion =  new TextEditingController(text: client.descripcion);
    dateFormat = new DateFormat('dd/MM/yy'); // Inicializar dateFormat con el formato deseado
    controllerFecha = new TextEditingController(text: dateFormat.format(DateTime.parse(client.fecha))); // Dar formato a la fecha al inicializar el controlador
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

  String formatPhoneNumber(String value) {
    final phoneNumber = value.replaceAll(RegExp(r'[^\d]'), '');
    final firstSubstring =
        phoneNumber.substring(0, phoneNumber.length > 3 ? 3 : phoneNumber.length);
    final secondSubstring = phoneNumber.length > 3 ? phoneNumber.substring(3) : '';

    return '$firstSubstring-$secondSubstring';
  }


}
