import 'package:flutter/material.dart';
import 'package:imersao_alura_mobile_project/model/dish_model.dart';

class BagProvider extends ChangeNotifier {
  List<DishModel> bag = [];

  void addAllDishes(List<DishModel> dishes) {
    bag.addAll(dishes);
    notifyListeners();
  }

  void removeDish(DishModel dish) {
    bag.remove(dish);
    notifyListeners();
  }

  void clear() {
    bag.clear();
    notifyListeners();
  }

  Map<DishModel, int> getMapByAmount() {
    Map<DishModel, int> mapResult = {};

    for (DishModel dish in bag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }

    return mapResult;
  }
}
