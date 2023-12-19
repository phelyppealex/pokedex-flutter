import 'package:floor/floor.dart';
import 'package:terceira_prova/model/pokemon.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemon')
  Future<List<Pokemon>> listarTodos();

  @Query('SELECT * FROM Pokemon WHERE id = :id')
  Future<List<Pokemon>> listarPorId(int id);

  @Query('SELECT * FROM Pokemon WHERE nome = :nome')
  Future<List<Pokemon>> listarPorNome(String nome);

  @insert
  Future<void> inserirPokemon(Pokemon p);

  @delete
  Future<void> deletarPokemon(Pokemon p);
}