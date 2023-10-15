class FruitModel {
  final double carbohydrates, protein, fat, sugar;
  final int calories;
  final String name;

  FruitModel(
      {required this.carbohydrates,
      required this.protein,
      required this.fat,
      required this.calories,
      required this.sugar,
      required this.name});
  factory FruitModel.fromMap(Map<String, dynamic> map) => FruitModel(
      carbohydrates: map['nutritions']['carbohydrates'],
      protein: map['nutritions']['protein'],
      fat: map['nutritions']['fat'],
      calories: map['nutritions']['calories'],
      sugar: map['nutritions']['sugar'],
      name: map['name']);
}