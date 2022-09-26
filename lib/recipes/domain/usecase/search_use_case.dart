import 'package:either_dart/either.dart';
import 'package:recipes_app_flutter/core/error/failure.dart';
import 'package:recipes_app_flutter/recipes/domain/base_repostery/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';

class SearchUseCase{
  final BaseRecipeRepostery repostery;

  SearchUseCase(this.repostery);
  Future<Either<Failure,List<Search>>>execute(String query)async{
    return await repostery.searchRecipe(query);
  }

}