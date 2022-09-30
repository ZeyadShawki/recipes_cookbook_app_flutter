import 'package:recipes_app_flutter/recipes/domain/entities/popular_recipe.dart';

class PopularRecipesModel extends PopularRecipe {
  const PopularRecipesModel(
      {required super.title,
      required super.image,
      required super.id,
      required super.readInMinutes,
      required super.serving,
      required super.pricePerServing});

  factory PopularRecipesModel.fromJson(Map<String,dynamic> json)=>
      PopularRecipesModel(
          title: json['title'],
          image: json['image']??'',
          id: json['id'],
          readInMinutes: json['readyInMinutes'],
          serving:  json['servings'],
          pricePerServing: json['pricePerServing']);

}
