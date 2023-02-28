import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectodart/modelos/cliente.model.dart';
import 'package:projectodart/pantallas/textbox.dart';
import 'package:projectodart/peticiones/cliente.peticion.dart';
import 'package:flutter/services.dart';

class RegisterClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterCliente();
}

class _RegisterCliente extends State<RegisterClient> {
  late TextEditingController controllerNombre;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerFecha;
  late TextEditingController controllerEstado;
  late TextEditingController controllerTelefono;
  late DateFormat formatter; 
  
  String? dropdownValue;
  String? estadoDropdownValue;

  @override
  void initState() {
    controllerNombre = TextEditingController();
    controllerDescripcion = TextEditingController();
    controllerFecha = TextEditingController();
    controllerEstado = TextEditingController();
    controllerTelefono = TextEditingController();
    formatter = DateFormat('dd/MM/yy');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            TextBox(controllerNombre, 'Nombre'),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: dropdownValue,
              decoration: InputDecoration(
                labelText: 'Tipo de problema',
                hintText: 'Seleccione un problema',
              ),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },
              items: <String>['Aire acondicionado', 'Termo', 'Otro']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
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
            DropdownButtonFormField<String>(
              value: estadoDropdownValue,
              decoration: InputDecoration(
                labelText: 'Estado',
                hintText: 'Seleccione un estado',
              ),
              onChanged: (value) {
                setState(() {
                  estadoDropdownValue = value;
                });
              },
              items: <String>['En proceso', 'COMPLETADO', 'SIN COMPLETAR']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
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
                String problema = dropdownValue!;
                String descripcion = controllerDescripcion.text;
                String fecha = controllerFecha.text;
                String estado = estadoDropdownValue!;
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
                  //Client client = Client.fromData(
                    //nombre,
                    //problema,
                    //descripcion,
                    //fecha,
                    //estado,
                    //telefono,
                  //);
                  addClient(client).then((value) {
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

  return '$firstSubstring$secondSubstring';
  }

}
