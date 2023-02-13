import 'package:flutter/material.dart';

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
      body: ListView(),

    );


  }



}