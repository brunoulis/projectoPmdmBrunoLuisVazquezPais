class Client{
  var id;
  var nombre;
  var problema;
  var descripcion;
  var fecha;
  var estado;
  var telefono;


  Client(this.id,this.nombre, this.problema, this.descripcion, this.fecha, this.estado, this.telefono);

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      json["_id"],
      json["nombre"],
      json["problema"],
      json["descripcion"],
      json["fecha"],
      json["estado"],
      json["telefono"],
    );
    
  }
}