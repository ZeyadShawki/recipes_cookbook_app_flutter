import 'package:either_dart/either.dart';
import 'package:recipes_app_flutter/core/error/failure.dart';

import 'package:recipes_app_flutter/recipes/domain/base_repostery/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/recipe_deatails.dart';

class GetRecipeDetailsUseCase{
  final BaseRecipeRepostery baseRecipeRepostery;

  GetRecipeDetailsUseCase(this.baseRecipeRepostery);
  Future<Either<Failure,RecipeDetails>> execute(int id)async{
    return await  baseRecipeRepostery.getRecipeDetails(id);
  }
}