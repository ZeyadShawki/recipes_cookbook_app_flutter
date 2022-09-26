class Ingredients {
  final String image;
  final String name;
  final String original;
  final double amount;
  final String unit;

  Ingredients(
      {required this.image, required this.name, required this.original, required this.amount, required this.unit});

  List<Object> get props => [image, name, original, amount, unit];

}