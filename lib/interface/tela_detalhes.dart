import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terceira_prova/dominio/pokemon.dart';

class TelaDetalhes extends StatelessWidget {
  final Pokemon pokemon;

  const TelaDetalhes({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do ${pokemon.nome}'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Card(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Image.network(pokemon.imagem,scale: 0.4,),
              Text('Nome: ${pokemon.nome.toUpperCase()}'),
              Text('Especie: ${pokemon.especie.toUpperCase()}'),
              Text('Altura: ${pokemon.altura.toString()}'),
              Text('Peso: ${pokemon.peso.toString()}'),
              Text('Habilidade: ${pokemon.habilidade.toUpperCase()}'),
              Text('Tipo: ${pokemon.tipo.toUpperCase()}'),
            ],
          ),
        ),
      ),
    );
  }
}