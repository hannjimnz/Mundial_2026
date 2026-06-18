import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ranking_provider.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<RankingProvider>()
          .cargarRanking();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<RankingProvider>();

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "MUNDIAL 2026",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),

      body: provider.cargando

          ? const Center(
              child: CircularProgressIndicator(),
            )

          : provider.ranking.isEmpty

              ? const Center(
                  child: Text(
                    "No hay datos",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )

              : Stack(
                  children: [

                    // Decoración superior
                    Positioned(
                      top: -70,
                      left: -70,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF3B30),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Decoración inferior
                    Positioned(
                      bottom: -70,
                      right: -70,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00D9FF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Column(

                      children: [

                        const SizedBox(height: 20),

                        const Icon(
                          Icons.emoji_events,
                          size: 80,
                          color: Colors.amber,
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "RANKING DEL MUNDIAL",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Expanded(

                          child: ListView.builder(

                            itemCount:
                                provider.ranking.length,

                            itemBuilder:
                                (context, index) {

                              final usuario =
                                  provider.ranking[index];

                              IconData icono =
                                  Icons.person;

                              if (index == 0) {
                                icono =
                                    Icons.emoji_events;
                              } else if (index == 1) {
                                icono =
                                    Icons.workspace_premium;
                              } else if (index == 2) {
                                icono =
                                    Icons.military_tech;
                              }

                              return Container(

                                margin:
                                    const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),

                                decoration:
                                    BoxDecoration(

                                  borderRadius:
                                      BorderRadius.circular(
                                    20,
                                  ),

                                  gradient:
                                      const LinearGradient(
                                    colors: [
                                      Color(0xFF00D9FF),
                                      Color(0xFF5E2EFF),
                                      Color(0xFFC7227D),
                                    ],
                                  ),

                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black26,
                                      offset:
                                          Offset(0, 5),
                                    ),
                                  ],
                                ),

                                child: ListTile(

                                  leading: Icon(
                                    icono,
                                    color:
                                        Colors.amber,
                                    size: 35,
                                  ),

                                  title: Text(
                                    usuario.nombre,
                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.white,
                                      fontWeight:
                                          FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),

                                  subtitle: Text(
                                    "${usuario.aciertos} aciertos",
                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.white70,
                                    ),
                                  ),

                                  trailing: Text(
                                    "#${index + 1}",
                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.white,
                                      fontSize: 22,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "FIFA WORLD CUP 2026",
                          style: TextStyle(
                            color: Colors.black54,
                            letterSpacing: 2,
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
    );
  }
}