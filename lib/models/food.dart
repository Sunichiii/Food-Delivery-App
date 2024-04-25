class Food{
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.availableAddons,
    required this.category,
});
}

//food categories

enum FoodCategory{
  burgers,
  sides,
  desserts,
  drinks,
}

//food addons
class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
});
}
