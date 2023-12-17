import 'package:flutter/material.dart';
import 'package:terceira_prova/dominio/pokemon.dart';
import 'package:terceira_prova/persistencia/pokemon_dao.dart';

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
        backgroundColor: Colors.red,
      ),
      body: ListarCapturados(pokemonDao: pokemonDao),

    );
  }
}

class ListarCapturados extends StatefulWidget {
  final PokemonDao pokemonDao;

  const ListarCapturados({
    super.key,
    required this.pokemonDao
  });

  @override
  State<ListarCapturados> createState() => _ListarCapturadosState();
}

class _ListarCapturadosState extends State<ListarCapturados> {
  late Future<List<Pokemon>> pokemons;

  @override
  void initState(){
    super.initState();
    pokemons = widget.pokemonDao.listarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: pokemons,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i){
              return Center(
                child: Card(
                  child: Column(
                    children: [
                      Image.network(snapshot.data![i].imagem),
                      Text(snapshot.data![i].nome.toUpperCase()),
                    ]
                  ),
                ),
              );
            } 
          );
        } else if(snapshot.hasError){
          throw Text('${snapshot.error}');
        }else {
          return Text('Carregando');
        }
      },
    );
  }
}