class Client{
  late var id;
  var nombre;
  var problema;
  var descripcion;
  var fecha;
  var estado;
  var telefono;


  Client(this.id,this.nombre, this.problema, this.descripcion, this.fecha, this.estado, this.telefono);

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      json['id'],
      json['nombre'],
      json['problema'],
      json['descripcion'],
      json['fecha'],
      json['estado'],
      json['telefono']
    );    
  }

  Client.fromData(this.nombre, this.problema, this.descripcion, this.fecha, this.estado, this.telefono);
}