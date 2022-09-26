import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String image;
  final String title;
  final int id;

  const Search({
    required this.image,
    required this.title,
    required this.id});

  @override
  List<Object> get props => [image, title, id];
}