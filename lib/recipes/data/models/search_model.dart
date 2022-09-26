import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';

class SearchModel extends Search{
  const SearchModel(
      { required super.image,
        required super.title,
        required super.id});
  factory SearchModel.fromJson(Map<String,dynamic>json)=>SearchModel
    (
      image: json['image'],
      title: json['title'],
      id: json['id']
  );
}