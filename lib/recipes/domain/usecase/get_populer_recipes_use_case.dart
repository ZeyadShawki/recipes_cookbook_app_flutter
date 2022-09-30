import 'package:either_dart/either.dart';
import 'package:recipes_app_flutter/core/error/failure.dart';
import 'package:recipes_app_flutter/recipes/domain/base_repostery/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/popular_recipe.dart';

class GetPopularRecipeUseCase{
  final BaseRecipeRepostery baseRecipeRepostery;

  GetPopularRecipeUseCase(this.baseRecipeRepostery);

  Future<Either<Failure,List<PopularRecipe>>> execute(){
    return baseRecipeRepostery.getPopulerRecipe();
  }
}