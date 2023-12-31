import 'package:flutter/material.dart';
import 'package:terceira_prova/model/pokemon.dart';
import 'package:terceira_prova/ui/tela_detalhes.dart';
import 'package:terceira_prova/ui/tela_soltar_pokemon.dart';
import 'package:terceira_prova/persistence/pokemon_dao.dart';

class ListarCapturados extends StatefulWidget {
  final PokemonDao pokemonDao;

  const ListarCapturados({
    super.key,
    required this.pokemonDao,
  });

  @override
  State<ListarCapturados> createState() => ListarCapturadosState();
}

class ListarCapturadosState extends State<ListarCapturados> {
  late Future<List<Pokemon>> pokemons;

  @override
  void initState() {
    super.initState();
    pokemons = widget.pokemonDao.listarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: pokemons,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              final Pokemon pokemon = snapshot.data![i];
              return Card(
                child: GestureDetector(
                  child: Column(
                    children: [
                      Image.network(pokemon.imagem),
                      Text(pokemon.nome.toUpperCase()),
                    ],
                  ),
                  onTap: () {
                    int indice = snapshot.data![i].id!;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaDetalhes(indice),
                      ),
                    );
                  },
                  onLongPress: () {
                    Pokemon p = snapshot.data![i];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaSoltar(pokemon: p, pokemonDao: widget.pokemonDao),
                      ),
                    );
                  },
                ),
              );
            },
          );
        } else if(!snapshot.hasData){
          return const Text('Nenhum pokemon capturado ainda, tente abrir a tela de captura de pokemons..');
        }else if (snapshot.hasError) {
          throw Text('${snapshot.error}');
        } else {
          throw Error;
        }
      },
    );
  }
}
