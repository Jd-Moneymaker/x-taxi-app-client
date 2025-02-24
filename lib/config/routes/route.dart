import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/homescreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ! auth screens

      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // ! auth screens

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sorry, file not found'),
            ],
          ),
        ),
      ),
    );
  }
}
