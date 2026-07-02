import 'package:flutter/material.dart';
import '../models/ranking.dart';
import '../services/ranking_service.dart';

class RankingProvider extends ChangeNotifier {
  final RankingService _service = RankingService();
  List<Ranking> ranking = [];
  bool cargando = false;

  // Modificamos aquí para que reciba el token
  Future<void> cargarRanking() async {
    print("Entro a cargar ranking");
    cargando = true;
    notifyListeners();

    try {
      // Le pasamos el token al servicio
      ranking = await _service.obtenerRanking();
    } catch (e) {
      print("Error en provider al cargar ranking: $e");
    } finally {
      cargando = false;
      notifyListeners();
    }
  }
}