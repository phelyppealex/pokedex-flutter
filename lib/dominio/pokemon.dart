import 'package:floor/floor.dart';

@entity
class Pokemon {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String nome;
  String especie;
  int altura;
  int peso;
  String habilidade;
  String tipo;
  String imagem;

  Pokemon({
    this.id,
    required this.nome,
    required this.especie,
    required this.altura,
    required this.peso,
    required this.habilidade,
    required this.tipo,
    required this.imagem,
  });
}