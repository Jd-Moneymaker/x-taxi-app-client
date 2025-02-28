import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width / 3.7,
        decoration: BoxDecoration(
          color: const Color.fromARGB(12, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: textBoldB,
            ),
          ],
        ),
      );
}
