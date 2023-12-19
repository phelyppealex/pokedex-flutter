import 'package:flutter/material.dart';
import 'package:terceira_prova/persistence/pokemon_dao.dart';
import 'package:terceira_prova/widgets/listar_capturados.dart';

class TelaPokemonCapturado extends StatelessWidget {
  final PokemonDao pokemonDao;

  const TelaPokemonCapturado({
    super.key,
    required this.pokemonDao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pokemons'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: ListarCapturados(pokemonDao: pokemonDao),

    );
  }
}