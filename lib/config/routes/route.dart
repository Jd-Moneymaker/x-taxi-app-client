import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/features/services/presentation/service_screen.dart';

import '../../features/home/presentation/pages/homescreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ! auth screens

      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case 'service-screen':
        return MaterialPageRoute(builder: (_) => const ServiceScreen());

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
