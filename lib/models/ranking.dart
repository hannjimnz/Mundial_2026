class Ranking {

  final String nombre;
  final int aciertos;

  Ranking({
    required this.nombre,
    required this.aciertos,
  });

  factory Ranking.fromJson(
      Map<String, dynamic> json) {

    return Ranking(
      nombre: json["nombre"],
      aciertos: json["aciertos"],
    );
  }
}