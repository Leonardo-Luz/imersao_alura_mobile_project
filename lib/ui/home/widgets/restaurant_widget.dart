import 'package:flutter/material.dart';
import 'package:imersao_alura_mobile_project/model/restaurant_model.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32,
      children: [
        Image.asset("assets/${restaurant.imagePath}", height: 68),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: List.generate(restaurant.stars.toInt(), (index) {
                return Image.asset('assets/others/star.png', width: 12);
              }),
            ),
            Text("${restaurant.distance}km"),
          ],
        ),
      ],
    );
  }
}
