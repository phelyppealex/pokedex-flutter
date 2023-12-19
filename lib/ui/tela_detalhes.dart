import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaDetalhes extends StatefulWidget {
  final int pokemonId;
  
  const TelaDetalhes(this.pokemonId,{
    super.key,
  });

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  late dynamic pokemon;
  
  Future<dynamic> getPokemon() async {
    String url = 'https://pokeapi.co/api/v2/pokemon/${widget.pokemonId}/';

    final resposta = await http.get(
      Uri.parse(url)
    );

    dynamic data = jsonDecode(resposta.body);

    return data;
  }

  @override
  void initState(){
    super.initState();
    pokemon = getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<dynamic>(
        future: pokemon,
        builder: (context, snapshot){
          if(snapshot.hasData){
            String tipos = '\n';
            String habilidades = '\n';
            String estatisticas = '';

            // TIPOS
            for(var t in snapshot.data!['types']){
              tipos = '$tipos  - ${t["type"]["name"]}\n';
            }

            // HABILIDADES
            for(var h in snapshot.data!['abilities']){
              habilidades = '$habilidades  - ${h["ability"]["name"]}\n';
            }

            // ESTATÍSTICAS
            for(var e in snapshot.data!['stats']){
              estatisticas = '$estatisticas${e["stat"]["name"].toUpperCase()}: ${e["base_stat"]}\n';
            }

            return Center(
              child: Column(
                children: [
                  Image.network(snapshot.data!['sprites']['front_default']),
                  Text(snapshot.data!['name'].toUpperCase()),
                  Text('Espécie: ${snapshot.data!['species']['name']}'),
                  Text('Tipos: $tipos'),
                  Text('Habilidades: $habilidades'),
                  Text(estatisticas),
                ],
              ),
            );
          }else{
            return const Placeholder();
          }
        },
      ),
    );
  }
}