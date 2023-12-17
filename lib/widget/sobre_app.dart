import 'package:flutter/material.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text('O app Pokédex é uma enciclopédia virtual que detém todas espécies de pokemons e suas características.')
          ]
        ),
      )
    );
  }
}