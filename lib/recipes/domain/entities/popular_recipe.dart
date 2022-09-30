import 'package:equatable/equatable.dart';

class PopularRecipe extends Equatable {
  final String title;
  final String image;
  final int id;
  final int readInMinutes;
  final int serving;
  final double pricePerServing;

  const PopularRecipe({required this.title,
    required this.image,
    required this.id,
    required this.readInMinutes,
    required this.serving,
    required this.pricePerServing});

  @override
  List<Object> get props =>
      [title, image, id, readInMinutes, serving, pricePerServing,];
}