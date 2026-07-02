import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 1. ¡IMPORTANTE! Agrega esta importación

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
    print("\n =======STATUS======== ${response.statusCode} \n");
    print("\n======DATA======= ${response.data} \n");

    return Lider.fromJson(response.data);
  }

  // Obtener ranking completo
  Future<List<Ranking>> obtenerRanking() async {
    
    // 2. Buscamos el token que guardaste en el teléfono durante el Login
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token_jwt'); // Ahora la variable 'token' ya existe aquí abajo 👇
    //String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJQcnVlYmFKV1RfbnVldm8iLCJpZF91c3VhcmlvIjoyMywiZXhwIjoxNzgyOTU5NzY2fQ.yuMBBspLZ5Ciqb3NkLBDzLctxw4rDNl36lJEYE7E5ow";
    print("[RankingService] El token recuperado para enviar es: '$token'");
    final response = await dio.get(
      '/ranking',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', 
        },
      ),
    );

    return (response.data as List)
        .map(
          (item) => Ranking.fromJson(item),
        )
        .toList();
  }
}