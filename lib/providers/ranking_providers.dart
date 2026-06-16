import 'package:flutter/material.dart';

import '../models/lider.dart';
import '../services/ranking_service.dart';

class RankingProvider extends ChangeNotifier {

  final RankingService _service =
      RankingService();

  Lider? lider;

  bool isLoading = false;

  Future<void> cargarLider() async {

    isLoading = true;
    notifyListeners();

    try {

      lider =
          await _service.obtenerLider();

    } catch (e) {

      debugPrint(e.toString());

    }

    isLoading = false;
    notifyListeners();
  }
}