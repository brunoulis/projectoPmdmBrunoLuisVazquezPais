import 'package:flutter/material.dart';
import 'package:projectodart/pantallas/message_response.dart';
import 'package:projectodart/pantallas/modifyClient.dart';
import 'package:projectodart/pantallas/registerClient.dart';
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
          onTap: () {
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (_) => ModifyClient(clientes[index]))).then((newClient){
              if(newClient != null){
                setState(() {
                                                                   
                  messageResponse(context, newClient.nombre + " ha sido modificado");
                });
              }
            });
          },
          onLongPress: (){
            //TODO: Eliminar cliente
            remoceClient(context, clientes[index]);
          },
          title: Text(clientes[index].nombre),
          subtitle: Text(clientes[index].problema+" "+clientes[index].telefono),
          leading: CircleAvatar(
            child: Text(clientes[index].nombre.substring(0, 1)),
          ),
          trailing: Icon(Icons.call,
          color: Colors.red,),
        );
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterClient())).then((newClient){
            if(newClient != null){
              setState(() {
                clientes.add(newClient);
                messageResponse(context, newClient.nombre + " ha sido añadido");
              });
            }
          });
        },
        tooltip: 'Añadir Cliente',
        child: Icon(Icons.add),
      ),
    );
  }

  remoceClient(BuildContext context, Client client){
    showDialog(context: context,
     builder: (_) => AlertDialog(
      title: Text("Eliminar Cliente"),
      content: Text("¿Estas seguro de eliminar el cliente " + client.nombre + "?"),
      actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      clientes.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
     )
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