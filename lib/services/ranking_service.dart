import 'package:dio/dio.dart';

import '../core/api_constants.dart';
import '../models/lider.dart';
import '../models/ranking.dart';

class RankingService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  // Obtener líder
  Future<Lider> obtenerLider() async {

    final response = await dio.get('/lider');

    return Lider.fromJson(response.data);
  }

  // Obtener ranking completo
  Future<List<Ranking>> obtenerRanking() async {

    final response = await dio.get('/ranking');

    return (response.data as List)
        .map(
          (item) => Ranking.fromJson(item),
        )
        .toList();
  }
}