import 'package:dio/dio.dart';

import '../core/api_constants.dart';
import '../models/lider.dart';

class RankingService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  Future<Lider> obtenerLider() async {

    final response = await dio.get('/lider');

    return Lider.fromJson(response.data);
  }
}