import 'package:flutter/material.dart';
import 'package:projectodart/modelos/cliente.model.dart';
import 'package:projectodart/pantallas/message_response.dart';
import 'package:projectodart/pantallas/modifyClient.dart';
import 'package:projectodart/pantallas/registerClient.dart';
import 'package:projectodart/pantallas/textbox.dart';
import 'package:projectodart/peticiones/cliente.peticion.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _MyHomePage();
    // TODO: implement createState
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      // le pasamos el contexto y la lista de clientes
      body: getClients(context, listaClientes()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterClient())).then((newClient){
              setState(() {
                messageResponse(context, newClient.nombre + " ha sido añadido");
              });
          });
        },
        tooltip: 'Añadir Cliente',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getClients(BuildContext context, Future<List<Client>> futureClient){

    return FutureBuilder(
      future: futureClient,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if(snapshot.hasError){
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text("Error: ${snapshot.error}"),
                ),
              );
            }
          return (snapshot.data != null) ?
            listaClients(snapshot.data) :
            Container(alignment: Alignment.center,
            child: Center(
              child: Text("No hay datos"),
            ),
          );
          default: 
          return Text("Recarga la pantalla...!");
        }
      },
    );
  }

  Widget listaClients(List<Client> clientes){

    return ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (_) => ModifyClient(clientes[index]))).then((newClient){
                setState(() {                                             
                  messageResponse(context, newClient.nombre + " ha sido modificado");
                });
            });
          },
          onLongPress: (){
            //TODO: Eliminar cliente
            removeClient(context, clientes[index]);
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
      );
  }

  removeClient(BuildContext context, Client client){
    showDialog(context: context,
     builder: (_) => AlertDialog(
      title: Text("Eliminar Cliente"),
      content: Text("¿Estas seguro de eliminar el cliente " + client.nombre + "?"),
      actions: [
                TextButton(
                  onPressed: () {
                    deleteClient(client.id).then((value){
                        if(value.id != null){

                          setState(() {
                            messageResponse(context, client.nombre + " ha sido eliminado");
                          });
                          Navigator.pop(context);
                        }

                      }
                    
                    );
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

