import 'package:flutter/material.dart';
import 'package:imersao_alura_mobile_project/data/restaurant_data.dart';
import 'package:imersao_alura_mobile_project/ui/_core/app_theme.dart';
import 'package:imersao_alura_mobile_project/ui/_core/bag_provider.dart';
import 'package:imersao_alura_mobile_project/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider())
      ],
      child: Application(),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen()
    );
  }
}
