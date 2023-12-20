import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:terceira_prova/widgets/animacao_carregamento.dart';

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
              habilidades = '$habilidades  - ${h["ability"]["name"].toUpperCase()}\n';
            }

            // ESTATÍSTICAS
            for(var e in snapshot.data!['stats']){
              estatisticas = '$estatisticas${e["base_stat"]} - ${e["stat"]["name"].toUpperCase()}\n';
            }

            return Center(
              child: Column(
                children: [
                  Image.network(snapshot.data!['sprites']['other']['official-artwork']['front_default'], scale: 0.3,),
                  Card(
                    elevation: 2.5,
                    color: Color.fromARGB(255, 255, 192, 192),
                    child: Column(
                      children:[
                        Text('${snapshot.data!['name'].toUpperCase()}',style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                            Text('\nEstatisticas:',  style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('\nHabilidades:',  style: TextStyle(fontWeight: FontWeight.bold)),
                          ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(estatisticas),
                            Text(habilidades,),
                          ],
                        ),
                        
                      
                      ]
                    )
                  ),
                  const Text('\nTipos:'),
                  Container(
                    padding: const EdgeInsets.only(left: 100,right: 100),
                    child: Column(
                      children: [
                        Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(tipos),
                            ],
                          )
                        ),
                      ]
                    ),
                  )
                ],
              ),
            );
          }else{
            return const Center(
              child: AnimacaoCarregamento(),
            );
          }
        },
      ),
    );
  }
}