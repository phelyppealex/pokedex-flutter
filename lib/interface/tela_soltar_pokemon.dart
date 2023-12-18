import 'package:flutter/material.dart';
import 'package:terceira_prova/dominio/pokemon.dart';
import 'package:terceira_prova/persistencia/pokemon_dao.dart';

class TelaSoltar extends StatelessWidget {
  final Pokemon pokemon;
  final PokemonDao pokemonDao;

  const TelaSoltar({
    Key? key,
    required this.pokemon,
    required this.pokemonDao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soltar ${pokemon.nome}?'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                pokemon.imagem,
                scale: 0.2,
              ),
              Text('Nome: ${pokemon.nome.toUpperCase()}'),
              Text('Especie: ${pokemon.especie.toUpperCase()}'),
              Text('Deseja mesmo soltá-lo?'),
              FloatingActionButton(
                onPressed: () async {
                  await pokemonDao.deletarPokemon(pokemon);
                  Navigator.pop(context);
                },
                child: Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
