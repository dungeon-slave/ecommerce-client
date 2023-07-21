class DishModel {
  final String imageRef;
  final String name;
  final String description;
  final double price;
  final List<String> ingredients;
  final String id;

  DishModel({
    required this.imageRef,
    required this.name,
    required this.price,
    required this.description,
    required this.ingredients,
    required this.id,
  });
}
