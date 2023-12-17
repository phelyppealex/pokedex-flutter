import 'package:floor/floor.dart';
import 'package:terceira_prova/dominio/tipo.dart';

@dao
abstract class TipoDao {
  @Query('SELECT * FROM Tipo WHERE nome = :nome')
  Future<List<Tipo>> listarPorNome();

  @Query('SELECT * FROM Tipo WHERE id = :id')
  Future<List<Tipo>> listarPorId();

  @Query('SELECT * FROM Tipo')
  Future<List<Tipo>> listarTodos();

  @insert
  Future<void> inserirTipo(Tipo t);

  @delete
  Future<void> deletarTipo(Tipo t);
  
}