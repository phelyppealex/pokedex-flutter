
import 'package:flutter/material.dart';
import 'package:terceira_prova/interface/tela_sobre.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokédex'),
      ),
      body: Text('Corpo'),
      drawer: TextButton(
        child: Text('sobre'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaSobre()
            ),
          );
        } ,
      ),
    );
  }
}