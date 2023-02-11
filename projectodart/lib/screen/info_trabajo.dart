import 'dart:ffi';

import 'package:projectodart/Infotrabajos.dart';
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            indexActual = index;
          });
        },
        selectedIndex: indexActual,
        destinations: const <Widget>[
          NavigationDestination(
            icon: icon(Icons.info_outline), 
            selectedIcon: Icon(Icons.info),
            label: 'El trabajo'),
          NavigationDestination(
            icon: icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'El trabajo en detalle',
          ),
        ],
      ),
      body: <Widget>[
        InfoTrabajoGeneral(info: info),
        InfoTrabajoDetail(info: info),
      ],
    );
  }
}

class InfoTrabajoGeneral extends StatelessWidget{
  const InfoTrabajoGeneral({ 
    Key? key,
    required this.info
    }) : super(key: key);

    final Future info;

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: info,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          Map<String, dynamic> info={
            "trabajo": snapshot.data["trabajo"],
            "descripcion": snapshot.data["descripcion"],
            "prosupuesto": snapshot.data["prosupuesto"],
            "ciudad": snapshot.data["ciudad"],
            "provincia": snapshot.data["provincia"],
            "calle": snapshot.data["calle"],
            "piso": snapshot.data["piso"],
            "numero": snapshot.data["numero"],
            "img": snapshot.data["img"],
          };

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 100),
                Image.network(info["img"]),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      const SizedBox(
                        height: 20
                      ),
                      Text(
                        info["trabajo"], 
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Trabajo: ${info["trabajo"]}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Descripcion: ${info["descripcion"]}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ]
                  ),
                )
              ],
            )
          );
        }
        return const Center(child: CircularProgressIndicator());
      }
    );
  }
}


class InfoTrabajoDetail extends StatelessWidget{
  const InfoTrabajoDetail({ 
    Key? key,
    required this.info
    }) : super(key: key);

    final Future info;

    @override
    Widget build(BuildContext context){
      return FutureBuilder(
        future: info,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            Map<String, dynamic> info={
              "trabajo": snapshot.data["trabajo"],
              "descripcion": snapshot.data["descripcion"],
              "prosupuesto": snapshot.data["prosupuesto"],
              "ciudad": snapshot.data["ciudad"],
              "provincia": snapshot.data["provincia"],
              "calle": snapshot.data["calle"],
              "piso": snapshot.data["piso"],
              "numero": snapshot.data["numero"],
              "img": snapshot.data["img"],
            };
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    MydireccionInfo(
                      ciudad: info["ciudad"],
                      provincia: info["provincia"],
                      calle: info["calle"],
                      piso: info["piso"],
                      numero: info["numero"],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Presupuesto:',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          info["prosupuesto"].toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Ciudad:',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          info["ciudad"].toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Provincia:',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          info["provincia"].toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Calle:',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          info["calle"].toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Piso:',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          info["piso"].toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Numero:',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          info["numero"].toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );

          }
          return const Center(child: CircularProgressIndicator());
        }
      );
    }

}

class MydireccionInfo extends StatelessWidget{
  const MydireccionInfo({
    required this.ciudad,
    required this.provincia,
    required this.calle,
    required this.piso,
    required this.numero,
    super.key
  });

  final String ciudad;
  final String provincia;
  final String calle;
  final Double piso;
  final Double numero;

  @override
  State<MydireccionInfo> createState() => _MydireccionInfoState();
}

class _MydireccionInfoState extends State<MydireccionInfo>{
  late Future direccion;

  @override
  void initState(){
    super.initState();
    direccion = obtDireccion(ciudad: widget.ciudad, provincia: widget.provincia, calle: widget.calle, piso: widget.piso, numero: widget.numero);
  }

  @override
  Widget build(BuildContext context){ 
    return FutureBuilder(
      future: direccion,
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          String ciudad= snapshot.data["ciudad"].toString();
          String provincia= snapshot.data["provincia"].toString();
          String calle= snapshot.data["calle"].toString();
          Double piso= snapshot.data["piso"].toString() as Double;
          Double numero= snapshot.data["numero"].toString() as Double;


          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Icon(Icons.thermostat, size: 35),
                  Text(
                    'Ciudad: $ciudad',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );

        }
      }
    );
  }
}