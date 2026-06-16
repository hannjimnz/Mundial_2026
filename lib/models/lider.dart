class Lider {

  final String nombre;
  final int aciertos;

  Lider({
    required this.nombre,
    required this.aciertos,
  });

  factory Lider.fromJson(Map<String, dynamic> json) {

    return Lider(
      nombre: json['nombre'],
      aciertos: json['aciertos'],
    );
  }
}