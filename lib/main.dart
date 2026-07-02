import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Importaciones de tus Providers
import 'providers/auth_provider.dart';
import 'providers/ranking_provider.dart';

// Importaciones de tus Screens
import 'screens/login_screen.dart';
import 'screens/ranking_screen.dart';

void main() {
  runApp(const AppState());
}

// Encapsulamos los providers globalmente en la raíz de la aplicación
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RankingProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mundial 2026',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // Usamos FutureBuilder para decidir cuál es la pantalla inicial de forma inteligente
      home: FutureBuilder<bool>(
        future: verificarToken(),
        builder: (context, snapshot) {
          // Mientras verifica el almacenamiento, muestra una pantalla de carga blanca
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          
          // Si snapshot.data es true (el token existe), va directo a la pantalla de Ranking
          if (snapshot.data == true) {
            return const RankingScreen(); // Asegúrate de que el nombre de tu clase coincida
          }
          
          // Si no hay token, lo manda a loguearse
          return const LoginScreen();
        },
      ),
      routes: {
        'login': (_) => const LoginScreen(),
        'ranking': (_) => const RankingScreen(), // Asegúrate de que se llame así en tu archivo
      },
    );
  }

  // Función interna para comprobar si ya hay un token guardado
  Future<bool> verificarToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_jwt');
    return token != null && token.isNotEmpty;
  }
}