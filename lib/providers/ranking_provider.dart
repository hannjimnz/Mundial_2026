import 'package:flutter/material.dart';

import '../models/lider.dart';
import '../services/ranking_service.dart';

class RankingProvider extends ChangeNotifier {

  final RankingService _service =
      RankingService();

  Lider? lider;

  bool cargando = false;

  Future<void> cargarLider() async {

    cargando = true;
    notifyListeners();

    try {

      lider =
          await _service.obtenerLider();

    } catch (e) {

      print(e);

    } finally {

      cargando = false;
      notifyListeners();

    }
  }
}