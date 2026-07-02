import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api_constants.dart';

class AuthService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: ApiConstants.baseUrl),
  );

  Future<bool> login(String username, String password) async {
    try {
      // 💡 CORRECCIÓN: FastAPI espera un formulario, no un JSON tradicional
      final formData = FormData.fromMap({
        'username': username,
        'password': password,
      });

      final response = await dio.post('/login', data: formData);

      if (response.statusCode == 200) {
        // Extraemos el token. Asegúrate de que tu Python devuelva la llave 'access_token'
        String token = response.data['access_token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token_jwt', token);
        
        print("====== LOGIN EXITOSO ======");
        print("Token guardado: Bearer $token");
        return true;
      }
      return false;
    } catch (e) {
      print("🚨 Error en AuthService al intentar loguear: $e");
      return false;
    }
  }
}