import 'package:floor/floor.dart';
import 'package:terceira_prova/dominio/pokemon.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemon')
  Future<List<Pokemon>> listarTodos();

  @Query('SELECT * FROM Pokemon WHERE id = :id')
  Future<List<Pokemon>> listarPorId(int id);

  @insert
  Future<void> inserirPokemon(Pokemon p);

  @delete
  Future<void> deletarPokemon(Pokemon p);
}