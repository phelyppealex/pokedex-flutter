import 'package:flutter/material.dart';
import 'package:terceira_prova/model/pokemon.dart';
import 'package:terceira_prova/persistence/pokemon_dao.dart';
import 'package:terceira_prova/ui/tela_pokemon_capturado.dart';
import 'package:terceira_prova/widgets/listar_capturados.dart';

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
                  Widget cancelButton = TextButton(
                    child: Text("Cancelar"),
                    onPressed:  () {
                      Navigator.pop(context);
                    },
                  );
                  Widget continueButton = TextButton(
                    child: Text("Soltá-lo"),
                    onPressed:  () {
                      pokemonDao.deletarPokemon(pokemon);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaPokemonCapturado(pokemonDao: pokemonDao),
                        )
                      );
                    },
                  );
                  // set up the AlertDialog
                  AlertDialog alert = AlertDialog(
                    title: Text("Soltar"),
                    content: Text("Deseja realmente soltar o ${pokemon.nome.toUpperCase()}"),
                    actions: [
                      cancelButton,
                      continueButton,
                    ],
                  );
                  
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}