import 'package:projectodart/infotrabajos.dart';
import 'package:flutter/material.dart';

class InfoTrabajo extends StatefulWidget {
  const InfoTrabajo({required this.trabajo ,super.key});

  final String? trabajo;

  @override
  State<InfoTrabajo> createState() => _InfoTrabajoState();

}

class _InfoTrabajoState extends State<InfoTrabajo> {
  late Future<dynamic> info;
  late int indexActual;

  @override
  void initState() {
    super.initState();
    info=obteInfoTrabajo(widget.trabajo?? "");
    indexActual=0;
  }
@Override
Widget build (BuildContext context){
  return Scaffold(extendBodyBehindAppBar: true,
  appBar: AppBar(centerTitle: true,
  titleTextStyle: const TextStyle(
  fontFamily: "LeckerliOne", color: Colors.black87, fontSize: 24),
  backgroundColor: const Color.fromARGB(125, 255, 255, 255),
  foregroundColor: Colors.black87,
  elevation: 0,
  title: [
    Text('${widget.trabajo}.General'),
    Text('${widget.trabajo}.Especifico'),
    ][indexActual]),
  ),),


}
  
}