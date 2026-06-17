import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ranking_provider.dart';

class RankingScreen extends StatefulWidget {

  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() =>
      _RankingScreenState();
}

class _RankingScreenState
    extends State<RankingScreen> {

  @override
  void initState() {

    super.initState();

    Future.microtask(() {
      context
          .read<RankingProvider>()
          .cargarLider();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<RankingProvider>();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Mundial 2026",
        ),
      ),

      body: Center(

        child: provider.cargando

            ? const CircularProgressIndicator()

            : provider.lider == null

                ? const Text(
                    "No hay datos",
                  )

                : Column(

                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      const Text(
                        "🏆 Líder del Mundial",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Text(
                        provider.lider!.nombre,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "${provider.lider!.aciertos} aciertos",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}