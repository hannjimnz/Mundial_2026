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
          'FIFA Predictor',
        ),
      ),

      body: Center(

        child: provider.isLoading

            ? const CircularProgressIndicator()

            : provider.lider == null

                ? const Text(
                    'Sin datos',
                  )

                : Card(

                    elevation: 5,

                    child: Padding(

                      padding:
                          const EdgeInsets.all(20),

                      child: Column(

                        mainAxisSize:
                            MainAxisSize.min,

                        children: [

                          const Text(
                            '🏆 Líder del Mundial',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Text(
                            provider.lider!.nombre,
                            style:
                                const TextStyle(
                              fontSize: 30,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          Text(
                            '${provider.lider!.aciertos} aciertos',
                            style:
                                const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}