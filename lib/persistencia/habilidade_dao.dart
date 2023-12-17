import 'package:floor/floor.dart';
import 'package:terceira_prova/dominio/habilidade.dart';

@dao
abstract class HabilidadeDao {
  @Query('SELECT * FROM Habilidade WHERE nome = :nome')
  Future<List<Habilidade>> listarPorNome();

  @Query('SELECT * FROM Habilidade WHERE id = :id')
  Future<List<Habilidade>> listarPorId();

  @Query('SELECT * FROM Habilidade')
  Future<List<Habilidade>> listarTodos();

  @insert
  Future<void> inserirHabilidade(Habilidade h);

  @delete
  Future<void> deletarHabilidade(Habilidade h);
  
}