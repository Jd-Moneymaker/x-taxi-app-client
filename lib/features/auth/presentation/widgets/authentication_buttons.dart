import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';

class AuthenticationButtons extends StatelessWidget {
  const AuthenticationButtons({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image, title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  image,
                  width: 22,
                  height: 22,
                ),
                SizedBox(width: 15),
                Text(
                  title,
                  style: textBoldB,
                )
              ],
            ),
          ),
        ),
      );
}
