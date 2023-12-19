import 'package:floor/floor.dart';

@entity
class Habilidade{
  @PrimaryKey(autoGenerate: true)
  int? id;
  String nome;

  Habilidade({
    this.id,
    required this.nome,
  });
}