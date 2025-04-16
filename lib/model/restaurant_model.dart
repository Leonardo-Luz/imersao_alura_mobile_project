import 'package:imersao_alura_mobile_project/model/dish_model.dart';

class RestaurantModel {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  int distance;
  List<String> categories;
  List<DishModel> dishes;

  RestaurantModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      stars: map['stars'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
      dishes: List<DishModel>.from(
        map['dishes'].map((dish) => DishModel.fromMap(dish)),
      ),
    );
  }

  @override
  String toString() {
    return 'Restaurant: {$id, $imagePath, $name, $description, $stars, $distance, $categories, $dishes}';
  }
}
