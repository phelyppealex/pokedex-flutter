import 'package:floor/floor.dart';

@entity
class Tipo{
  @PrimaryKey(autoGenerate: true)
  int? id;
  String nome;

  Tipo({
    this.id,
    required this.nome,
  });
}