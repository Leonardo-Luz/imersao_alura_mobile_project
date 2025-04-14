import 'package:flutter/material.dart';
import 'package:imersao_alura_mobile_project/ui/_core/app_theme.dart';
import 'package:imersao_alura_mobile_project/ui/splash/splash_screen.dart';

void main(){
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.appTheme, home: SplashScreen(),);
  }
}
