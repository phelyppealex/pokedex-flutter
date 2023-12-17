import 'package:flutter/material.dart';
import 'package:terceira_prova/interface/tela_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*
  final database = await $FloorAppDatabase
    .databaseBuilder('app_database.db')
    .build();
  
  final dao = database.professorDao;
  */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TelaHome(),
    );
  }
}