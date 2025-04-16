import 'package:flutter/material.dart';
import 'package:imersao_alura_mobile_project/model/dish_model.dart';
import 'package:imersao_alura_mobile_project/model/restaurant_model.dart';
import 'package:imersao_alura_mobile_project/ui/_core/bag_provider.dart';
import 'package:imersao_alura_mobile_project/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Image.asset("assets/${restaurant.imagePath}", width: 128),

          Text(
            "Mais Pedidos",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Column(
            children: List.generate(restaurant.dishes.length, (index) {
              DishModel dish = restaurant.dishes[index];
              return ListTile(
                onTap: () {},
                leading: Image.asset(
                  'assets/dishes/default.png',
                  width: 48,
                  height: 48,
                ),
                title: Text(dish.name),
                subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                trailing: IconButton(
                  onPressed: () {
                    context.read<BagProvider>().addAllDishes([dish]);
                  },
                  icon: Icon(Icons.add),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
