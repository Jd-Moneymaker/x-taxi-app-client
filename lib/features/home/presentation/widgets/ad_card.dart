import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key, this.title, this.image});

  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 20, top: 30, bottom: 30),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 140,
        decoration: BoxDecoration(
          color: const Color.fromARGB(12, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: textBoldB.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Learn more',
                        style: textB,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              image ??
                  'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/v1.1/Motorcycle.png',
              height: 140,
              width: 140,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
}
