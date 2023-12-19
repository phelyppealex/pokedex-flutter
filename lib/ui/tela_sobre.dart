import 'package:flutter/material.dart';
import 'package:terceira_prova/persistence/pokemon_dao.dart';
import 'package:terceira_prova/widgets/card_dev.dart';

class TelaSobre extends StatelessWidget {
  final PokemonDao pokemonDao;

  const TelaSobre({
    super.key,
    required this.pokemonDao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre os Desenvolvedores'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: const Center (
        child: Column(
          children: [
            CardDev(
              imagem: 'images/erick.png',
              nome: 'Erick Barros',
              email: 'ehbs.13579@gmail.com',
              github: 'https://github.com/erickhbs',
            ),
            CardDev(
              imagem: 'images/phelyppe.jpg',
              nome: 'Phelyppe Álex',
              email: 'phelyppesilva@gmail.com',
              github: 'https://github.com/phelyppealex',
            )
          ],
        ),
      ),
    );
  }
}
