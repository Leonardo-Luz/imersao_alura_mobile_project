class DishModel {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final int price;

  DishModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'description': description,
      'price': price,
    };
  }

  factory DishModel.fromMap(Map<String, dynamic> map) {
    return DishModel(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
      description: map['description'],
      price: map['price'],
    );
  }

  @override
  String toString() {
    return 'Dish{id: $id, imagePath: $imagePath, name: $name, description: $description, price: $price}';
  }
}
