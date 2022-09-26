import 'package:recipes_app_flutter/recipes/domain/entities/nutrients.dart';

class NutrientsModel extends Nutrients {
  const NutrientsModel(
      {required super.name, required super.amount, required super.unit});
  factory NutrientsModel.fromJson(Map<String,dynamic> json)=>
      NutrientsModel(
          name: json['name'],
          amount: json['amount'],
          unit: json['unit']);
}
