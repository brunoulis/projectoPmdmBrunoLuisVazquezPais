class Client {
  var id;
  var name;
  var problem;
  var descripcion;
  var date;
  var state;
  var phone;

  Client({
    this.id,
    this.name,
    this.descripcion,
    this.problem,
    this.date,
    this.state,
    this.phone,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'],
      name: json['nombre'],
      descripcion: json['descripcion'],
      problem: json['problema'],
      date: json['fecha'],
      state: json['estado'],
      phone: json['telefono'],
    );
  }

   
  
}
