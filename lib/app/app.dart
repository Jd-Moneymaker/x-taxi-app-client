import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/routes/route.dart';
import 'package:x_taxi_app_client/config/theme/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode
            .light, // You can change this to light or dark based on user choice
        theme: lightTheme, // Light theme
        darkTheme: darkTheme, // Dark theme
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      );
}
