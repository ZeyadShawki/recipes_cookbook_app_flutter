import 'package:either_dart/either.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/recipe_deatails.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';

import '../../../core/error/failure.dart';

abstract class BaseRecipeRepostery{
  Future<Either<Failure,List<Search>>> searchRecipe(String query);
  Future<Either<Failure,RecipeDetails>> getRecipeDetails(int id);
}