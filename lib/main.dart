import 'package:flutter/material.dart';
import 'package:terceira_prova/interface/tela_home.dart';
import 'package:terceira_prova/database/app_database.dart';
import 'package:terceira_prova/persistencia/pokemon_dao.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase
    .databaseBuilder('app_database.db')
    .build();
  
  final pokemonDao = database.pokemonDao;

  runApp(MyApp(pokemonDao: pokemonDao));
}

class MyApp extends StatelessWidget {
  final PokemonDao pokemonDao;
  const MyApp({
    super.key,
    required this.pokemonDao
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: TelaHome(pokemonDao: pokemonDao),
    );
  }
}