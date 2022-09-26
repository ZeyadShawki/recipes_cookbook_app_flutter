import 'package:recipes_app_flutter/recipes/domain/entities/ingredients.dart';

class IngredientsModel extends Ingredients {
  IngredientsModel(
      {required super.image,
      required super.name,
      required super.original,
      required super.amount,
      required super.unit});

  factory IngredientsModel.fromJson(Map<String,dynamic> json)=>
      IngredientsModel(
          image: json['image']??'',
          name: json['name']??'',
          original: json['original']??'',
          amount: json['amount']??'',
          unit: json['unit']??"");
}
