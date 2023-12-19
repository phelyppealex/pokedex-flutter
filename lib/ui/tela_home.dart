
import 'package:flutter/material.dart';
import 'package:terceira_prova/ui/tela_captura.dart';
import 'package:terceira_prova/ui/tela_pokemon_capturado.dart';
import 'package:terceira_prova/ui/tela_sobre.dart';
import 'package:terceira_prova/persistence/pokemon_dao.dart';
import 'package:terceira_prova/widgets/sobre_app.dart';

class TelaHome extends StatelessWidget {
  final PokemonDao pokemonDao;

  const TelaHome({
    super.key,
    required this.pokemonDao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: const SobreApp(),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('CAPTURAR POKEMONS'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaCaptura(pokemonDao: pokemonDao)
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('POKEMONS CAPTURADOS'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaPokemonCapturado(pokemonDao: pokemonDao)
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('SOBRE NÓS'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaSobre(pokemonDao: pokemonDao)
                  ),
                );
              },
            ),
          ]
        )
      )
    );
  }
}