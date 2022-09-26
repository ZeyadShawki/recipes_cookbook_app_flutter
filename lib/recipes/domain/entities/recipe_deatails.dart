import 'package:equatable/equatable.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/ingredients.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/nutrients.dart';

class RecipeDetails extends Equatable {
  final String title;
  final int id;
  final int readyInMinutes;
  final String image;
  final String sourceUrl;
  final String summary;
  final List<Nutrients> nutrients;
  final List<Ingredients> ingredients;

  const RecipeDetails({required this.title,
    required this.id,
    required this.readyInMinutes,
    required this.image,
    required this.sourceUrl,
    required this.summary,
    required this.nutrients,
    required this.ingredients,});

  @override
  List<Object> get props =>
      [
        title,
        id,
        readyInMinutes,
        image,
        sourceUrl,
        summary,
        nutrients,
        ingredients,
      ];

}