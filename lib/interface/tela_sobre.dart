import 'package:flutter/material.dart';
import 'package:terceira_prova/widget/card_dev.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: const Text('home'),
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
