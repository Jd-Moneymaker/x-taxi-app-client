import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/utils/bottom_nav_bar.dart';
import 'package:x_taxi_app_client/features/home/presentation/widgets/vehicle_card.dart';
import '../../../core/widgets/custom_app_bar.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: 'Services',
          showBackButton: true,
        ),
        // ! bottom nav bar
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: const BottomNavBar(),
        ),
        // ! bottom nav bar
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Go anywhere, get anything',
                style: textBoldB.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 25),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VehicleCard(
                    title: 'Trip',
                    image:
                        'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/Hatchback.png',
                  ),
                  VehicleCard(
                    title: 'Intercity',
                    image:
                        'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/package_UberXL_new_2022.png',
                  ),
                  VehicleCard(
                    title: 'Moto',
                    image:
                        'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/v1.1/Motorcycle.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
