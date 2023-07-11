class DishModel {
  final String imageRef;
  final String name;
  final String type;
  final String description;
  final String price;
  final List<String> ingredients;

  DishModel(
      {required this.imageRef,
      required this.name,
      required this.type,
      required this.price,
      required this.description,
      required this.ingredients});
}
