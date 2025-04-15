import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imersao_alura_mobile_project/model/restaurant_model.dart';

class RestaurantData extends ChangeNotifier {
  List<RestaurantModel> listRestaurant = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurantData in restaurantsData) {
      RestaurantModel restaurant = RestaurantModel.fromMap(restaurantData);
      listRestaurant.add(restaurant);
    }
  }
}
