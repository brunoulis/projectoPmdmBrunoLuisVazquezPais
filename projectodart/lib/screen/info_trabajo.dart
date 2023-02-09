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


class InfoComarcaDetall extends StatelessWidget{}