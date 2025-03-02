import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                thickness: 2.4,
                color: Color.fromARGB(80, 0, 0, 5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Text(
                title,
                style: textBoldB,
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2.4,
                color: Color.fromARGB(80, 0, 0, 5),
              ),
            ),
          ],
        ),
      );
}
