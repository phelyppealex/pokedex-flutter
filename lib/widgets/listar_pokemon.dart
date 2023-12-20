import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:terceira_prova/model/pokemon.dart';
import 'package:terceira_prova/persistence/pokemon_dao.dart';
import 'package:terceira_prova/widgets/animacao_carregamento.dart';

class ListarPokemonTC extends StatefulWidget {
  final PokemonDao pokemonDao; 
  late Future<Map<String, dynamic>> pokemonsApi;
  
  ListarPokemonTC({
    super.key,
    required this.pokemonDao,
  });

  @override
  State<ListarPokemonTC> createState() => _ListarPokemonTCState();
}

class _ListarPokemonTCState extends State<ListarPokemonTC> {
  late Future<List<dynamic>> pokemons;
  late List<int> pokemonsIndexes;

  Future<List<dynamic>> getPokemonsApi() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    getPokemonsId();

    try{
      List<dynamic> data = [];

      if(!(connectivityResult == ConnectivityResult.none)){
        Random r = Random();
        for(var i = 0; i < 6; i++){
          int indice = r.nextInt(1017) + 1;
          
          String url = 'https://pokeapi.co/api/v2/pokemon/$indice/';
          
          final resposta = await http.get(
            Uri.parse(url)
          );
          
          if(resposta.statusCode == HttpStatus.ok){
            data.add(jsonDecode(resposta.body));
          }else{
            throw 'Erro ao buscar um pokemon específico';
          }
        }
      }else{
        throw 'Você não está conectado a internet';
      }
      return data;
    }catch (e){
      throw e.toString();
    }
  }

  Future<List<int>> getPokemonsId() async {
    final pokemonsBD = await widget.pokemonDao.listarTodos();

    List<int> indices = [];

    for(var p in pokemonsBD){
      indices.add(p.id!);
    }

    return indices;
  }

  @override
  void initState(){
    super.initState();
    pokemons = getPokemonsApi();
    pokemonsIndexes = [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: pokemons,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i){
              List<String> linkDividido = snapshot.data![i]['sprites']['front_default'].split('/');
  
              String numero = '';
              for(int i = 0; i < linkDividido[linkDividido.length-1].length-4; i++){
                numero += linkDividido[linkDividido.length-1][i];
              }
              
              int n = int.parse(numero);

              String pokebolaImage = 'pokebola';

              if(pokemonsIndexes.contains(n)){
                pokebolaImage = 'pokebola_sem_cor';
              }

              return Center(
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.network(snapshot.data![i]['sprites']['front_default']),
                          Text('${snapshot.data![i]["name"].toUpperCase()}')
                        ],
                      ),
                      TextButton.icon(
                        icon: Image.asset(
                            'images/$pokebolaImage.png',
                            width: 60,
                            height: 60,
                          ),
                          label: Text(''),
                          onPressed: (){
                            
                            Pokemon p = Pokemon(
                              id: n,
                              nome: snapshot.data![i]['name'],
                              especie: snapshot.data![i]['species']['name'],
                              altura: snapshot.data![i]['height'],
                              peso: snapshot.data![i]['weight'],
                              habilidade: snapshot.data![i]['abilities'][0]['ability']['name'],
                              tipo: snapshot.data![i]['types'][0]['type']['name'],
                              imagem: snapshot.data![i]['sprites']['front_default']
                            );
                            
                            widget.pokemonDao.inserirPokemon(p);

                            setState(() {
                              pokemons = pokemons;
                              pokemonsIndexes.add(p.id!);
                            });
                          },
                      )
                    ],
                  )
                ),
              );
            },
          );
        }else if(snapshot.hasError){
          return Center(
            child: Text('${snapshot.error}'),
          );
        }else if(snapshot.error == 'Você não está conectado a internet'){
          return Center(
            child: Text('${snapshot.error}'),
          );
        }else{
          return const Center(
              child: AnimacaoCarregamento(),
          );
        }
      },
    );
  }
}
