import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';

class CustomSheet extends StatelessWidget {
  const CustomSheet({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Choose another way to verify',
              style: textBoldB.copyWith(fontSize: 14),
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/svg/solid/phone.svg',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Phone call to *****26514',
                style: textBoldB,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/svg/solid/google.svg',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Google',
                style: textBoldB,
              ),
              onTap: () {
                // Handle option 2 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/svg/solid/email.svg',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Email',
                style: textBoldB,
              ),
              onTap: () {
                // Handle option 3 tap
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 10,
              ),
              title: Text(
                'See all options',
                style: textBoldB,
              ),
              onTap: () {
                // Handle option 3 tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
}
