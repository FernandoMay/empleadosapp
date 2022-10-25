import 'dart:convert';

Res resFromJson(String str) => Res.fromJson(json.decode(str));

String resToJson(Res data) => json.encode(data.toJson());

class Res {
  Res({
    required this.data,
  });

  List<Empleado> data;

  factory Res.fromJson(Map<String, dynamic> json) => Res(
        data:
            List<Empleado>.from(json["data"].map((x) => Empleado.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

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
  int sueldo;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        id: json["id"]! as int,
        nombre: json["nombre"]! as String,
        apellidop: json["apellidop"]! as String,
        apellidom: json["apellidom"]! as String,
        area: json["area"]! as String,
        fechanac: DateTime.parse(json["fechanac"]),
        sueldo: json["sueldo"]! as int,
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "nombre": nombre,
        "apellidop": apellidop,
        "apellidom": apellidom,
        "area": area,
        "fechanac": fechanac.toString(),
        "sueldo": sueldo.toString(),
      };
}
