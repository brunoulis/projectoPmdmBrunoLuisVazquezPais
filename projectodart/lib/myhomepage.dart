import 'package:flutter/material.dart';
import 'package:projectodart/registerClient.dart';
import 'package:projectodart/textbox.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  
  @override
  State<StatefulWidget> createState() => _MyHomePage();
    // TODO: implement createState
    
  
  
  

  
}

class _MyHomePage extends State<MyHomePage> {
  int _counter = 0;

  List<Client> clientes=[
    Client('Juan', 'Aire acondicionado no funciona', 'Descripcion1', '13/02/23', 'Finalizado', '75695233465'),
    Client('Pedro', 'Aire acondicionado no funciona', 'Descripcion2', '11/02/23', 'Sin Finalizar', '75695233465'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          onLongPress: (){},
          title: Text(clientes[index].nombre+""+clientes[index].problema),
          subtitle: Text(clientes[index].descripcion+""+clientes[index].fecha+""+clientes[index].estado+""+clientes[index].telefono),
          leading: CircleAvatar(
            child: Text(clientes[index].nombre.subString(0,1)),
          ),
          trailing: Icon(Icons.call,
          color: Colors.red,),
        );
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterClient()));
        },
        tooltip: 'Añadir Cliente',
        child: Icon(Icons.add),
      ),
    );
  }

  
}

class Client{
  var nombre;
  var problema;
  var descripcion;
  var fecha;
  var estado;
  var telefono;


  Client(this.nombre, this.problema, this.descripcion, this.fecha, this.estado, this.telefono);


}