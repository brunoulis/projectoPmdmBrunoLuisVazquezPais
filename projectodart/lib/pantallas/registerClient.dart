import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectodart/modelos/cliente.model.dart';
import 'package:projectodart/pantallas/textbox.dart';
import 'package:projectodart/peticiones/cliente.peticion.dart';
import 'package:flutter/services.dart';
// Importamos el paquete flutter_masked_text para poder usar el controlador MaskedTextController
import 'package:flutter_masked_text/flutter_masked_text.dart';

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
  late MaskedTextController controllerTelefono;

  final DateFormat formatter = DateFormat('dd/MM/yy');

  @override
  void initState(){
    
    controllerNombre = new TextEditingController();
    controllerProblema = new TextEditingController();
    controllerDescripcion =  new TextEditingController();
    controllerFecha = new TextEditingController();
    controllerEstado = new TextEditingController();
    controllerTelefono = new MaskedTextController(mask: '000-000-0000');
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
          TextFormField(
            controller: controllerFecha,
            decoration: InputDecoration(
              labelText: 'Fecha',
              hintText: 'dd/mm/aa'
            ),
            onTap: () async {
              DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100)
              );
              if (picked != null) {
                String formattedDate = formatter.format(picked);
                controllerFecha.text = formattedDate;
              }
            },
          ),
          TextBox(controllerEstado, 'Estado'),
          TextFormField(
            controller: controllerTelefono,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Telefono',
            ),
          ),
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
