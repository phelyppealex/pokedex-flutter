import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:terceira_prova/dominio/pokemon.dart';
import 'package:terceira_prova/persistencia/pokemon_dao.dart';

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

  Future<List<dynamic>> getPokemonsApi() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    
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

  @override
  void initState(){
    super.initState();
    pokemons = getPokemonsApi();
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
                            'images/pokebola.png',
                            width: 60,
                            height: 60,
                          ),
                          label: Text(''),
                          onPressed: (){
                            Pokemon p = Pokemon(
                              nome: snapshot.data![i]['name'],
                              especie: snapshot.data![i]['species']['name'],
                              altura: snapshot.data![i]['height'],
                              peso: snapshot.data![i]['weight'],
                              habilidade: snapshot.data![i]['abilities'][0]['ability']['name'],
                              tipo: snapshot.data![i]['types'][0]['type']['name'],
                              imagem: snapshot.data![i]['sprites']['front_default']
                            );
                            print(p);
                            widget.pokemonDao.inserirPokemon(p);
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
            child: Text('Carregando...'),
          );
        }
      },
    );
  }
}
