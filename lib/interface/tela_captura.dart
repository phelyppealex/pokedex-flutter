import 'package:flutter/material.dart';
import 'package:terceira_prova/persistencia/pokemon_dao.dart';
import 'package:terceira_prova/widget/listar_pokemon.dart';

class TelaCaptura extends StatelessWidget {
  final PokemonDao pokemonDao; 
  const TelaCaptura({super.key, required this.pokemonDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text('Tela Captura'),
      ),
      body: ListarPokemonTC(pokemonDao: pokemonDao),
    );
  }
}