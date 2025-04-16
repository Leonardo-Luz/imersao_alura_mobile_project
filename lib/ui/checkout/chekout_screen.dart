import 'package:flutter/material.dart';
import 'package:imersao_alura_mobile_project/model/dish_model.dart';
import 'package:imersao_alura_mobile_project/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        actions: [
          TextButton(
            onPressed: () => bagProvider.clear(),
            child: Text("Limpar"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pedidos",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              Column(
                children:
                    bagProvider.getMapByAmount().keys.isNotEmpty
                        ? List.generate(
                          bagProvider.getMapByAmount().keys.length,
                          (index) {
                            DishModel dish =
                                bagProvider
                                    .getMapByAmount()
                                    .keys
                                    .toList()[index];

                            return ListTile(
                              onTap: () {},
                              leading: Image.asset(
                                'assets/dishes/default.png',
                                width: 48,
                                height: 48,
                              ),
                              title: Text(dish.name),
                              subtitle: Text(
                                "R\$${dish.price.toStringAsFixed(2)}",
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      bagProvider.addAllDishes([dish]);
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  Text(
                                    bagProvider
                                        .getMapByAmount()[dish]
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      bagProvider.removeDish(dish);
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                        : [Text("Nenhum pedido foi adicionado!")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
