import 'package:recipes_app_flutter/recipes/data/models/ingredients_model.dart';
import 'package:recipes_app_flutter/recipes/data/models/nutrients_model.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/ingredients.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/nutrients.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/recipe_deatails.dart';

class RecipeDetailsModel extends RecipeDetails {
  const RecipeDetailsModel(
      {required super.title,
      required super.id,
      required super.readyInMinutes,
      required super.image,
      required super.sourceUrl,
      required super.summary,
      required super.nutrients,
      required super.ingredients});

factory  RecipeDetailsModel.fromJson(Map<String,dynamic>json)=>
    RecipeDetailsModel(
        title: json['title'],
        id: json['id'],
        readyInMinutes: json['readyInMinutes'],
        image: json['image'],
        sourceUrl:  json['spoonacularSourceUrl'],
        summary:  json['summary'],
        nutrients: List<Nutrients>.from((json['nutrition']['nutrients'] as List).map((e) => NutrientsModel.fromJson(e))),
        ingredients: List<Ingredients>.from((json['extendedIngredients'] as List).map((e) => IngredientsModel.fromJson(e))));

}
