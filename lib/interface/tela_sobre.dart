import 'package:flutter/material.dart';
import 'package:terceira_prova/persistencia/pokemon_dao.dart';
import 'package:terceira_prova/widget/card_dev.dart';

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
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text('Sobre os Desenvolvedores'),
      ),
      body: const Center (
        child: Column(
          children: [
            CardDev(
              nome: 'Erick Barros',
              email: 'ehbs.13579@gmail.com',
              github: 'https://github.com/erickhbs',
            ),
            SizedBox(height: 50),
            CardDev(
              nome: 'Phelyppe Álex',
              email: 'phelyppesilva@gmail.com',
              github: 'https://github.com/phelyppealex',
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: TextButton( 
          child: const Text('Home'),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
