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
  final DateFormat formatter = DateFormat('dd/MM/yy');

  @override void initState() {
    // TODO: implement initState
    Client client = widget._client;
    id = client.id;
    controllerNombre = new TextEditingController(text: client.name);
    controllerProblema = new TextEditingController(text: client.problem);
    controllerDescripcion =  new TextEditingController(text: client.descripcion);
    final DateFormat formatter = DateFormat('dd/MM/yy');
    controllerEstado = new TextEditingController(text: client.state);
    controllerTelefono = new TextEditingController(text: client.phone);
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificacion del de Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            TextBox(controllerNombre, 'Nombre'),
            TextBox(controllerProblema, 'Problema'),
            TextBox(controllerDescripcion, 'Descripcion'),
            TextFormField(
              controller: controllerFecha,
              decoration: InputDecoration(
                labelText: 'Fecha',
                hintText: 'dd/mm/aa',
              ),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (picked != null) {
                  String formattedDate = formatter.format(picked);
                  controllerFecha.text = formattedDate;
                }
              },
            ),
            SizedBox(height: 16),
            TextBox(controllerEstado, 'Estado'),
            SizedBox(height: 16),
            TextFormField(
              controller: controllerTelefono,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Telefono',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    controllerTelefono.text = formatPhoneNumber(value);
                    controllerTelefono.selection = TextSelection.fromPosition(
                        TextPosition(offset: controllerTelefono.text.length));
                  }
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String nombre = controllerNombre.text;
                String problema = controllerProblema.text;
                String descripcion = controllerDescripcion.text;
                String fecha = controllerFecha.text;
                String estado = controllerEstado.text;
                String telefono = controllerTelefono.text;

                if (nombre.isNotEmpty &&
                    problema.isNotEmpty &&
                    descripcion.isNotEmpty &&
                    fecha.isNotEmpty &&
                    estado.isNotEmpty &&
                    telefono.isNotEmpty) {
                  Client client = Client(
                    name: nombre,
                    problem: problema,
                    descripcion: descripcion,
                    date: fecha,
                    state: estado,
                    phone: telefono,
                  );
                  updateClient(client).then((value) {
                    if (value.id != '') {
                      Navigator.pop(context, value);
                    }
                  });
                }
              },
              child: Text('Guardar'),
            ),
          ],
        ),
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
