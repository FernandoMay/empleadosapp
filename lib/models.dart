class Empleado {
  Empleado({
    this.id,
    required this.nombre,
    required this.apellidop,
    required this.apellidom,
    required this.area,
    required this.fechanac,
    required this.sueldo,
  });

  int? id;
  String nombre;
  String apellidop;
  String apellidom;
  String area;
  DateTime fechanac;
  double sueldo;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        id: json["id"]! as int,
        nombre: json["nombre"]! as String,
        apellidop: json["apellidop"]! as String,
        apellidom: json["apellidom"]! as String,
        area: json["area"]! as String,
        fechanac: json["fechanac"]! as DateTime,
        sueldo: json["sueldo"]! as double,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidop": apellidop,
        "apellidom": apellidom,
        "area": area,
        "fechanac": fechanac,
        "sueldo": sueldo,
      };
}
