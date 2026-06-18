import 'package:flutter/material.dart';

import '../models/ranking.dart';
import '../services/ranking_service.dart';

class RankingProvider extends ChangeNotifier {

  final RankingService _service =
      RankingService();

  List<Ranking> ranking = [];

  bool cargando = false;

  Future<void> cargarRanking() async {

    cargando = true;
    notifyListeners();

    try {

      ranking =
          await _service.obtenerRanking();

    } catch (e) {

      print(e);

    } finally {

      cargando = false;
      notifyListeners();

    }
  }
}