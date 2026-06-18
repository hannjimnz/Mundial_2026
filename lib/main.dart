import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/ranking_provider.dart';
import 'screens/ranking_screen.dart';

void main() {

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) =>
              RankingProvider(),
        ),

      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Mundial 2026",

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),

      home: const RankingScreen(),
    );
  }
}