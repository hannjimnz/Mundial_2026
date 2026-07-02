import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool cargando = false;

  Future<bool> iniciarSesion(String usuario, String password) async {
    cargando = true;
    notifyListeners();

    final exito = await _authService.login(usuario, password);

    cargando = false;
    notifyListeners();
    return exito;
  }
}