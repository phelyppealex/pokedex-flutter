import 'package:flutter/material.dart';
import 'package:terceira_prova/persistence/pokemon_dao.dart';
import 'package:terceira_prova/widgets/listar_pokemon.dart';

class TelaCaptura extends StatelessWidget {
  final PokemonDao pokemonDao; 
  const TelaCaptura({super.key, required this.pokemonDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Captura'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: ListarPokemonTC(pokemonDao: pokemonDao),
    );
  }
}