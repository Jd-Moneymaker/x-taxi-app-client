import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 180,
        decoration: BoxDecoration(
          color: const Color.fromARGB(12, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Save time and \nmoney',
                      style: textBoldB.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Learn More',
                        style: textBoldB,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(15)),
                child: Image.network(
                  'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/v1.1/Motorcycle.png',
                  height: double.infinity,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
}
