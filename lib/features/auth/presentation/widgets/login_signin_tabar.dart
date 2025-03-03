import 'package:flutter/material.dart';

import '../../../../config/style/style.dart';
import '../pages/auth/login.dart';
import '../pages/auth/signup.dart';

class LoginSigninTabBar extends StatelessWidget {
  const LoginSigninTabBar({super.key});

  @override
  Widget build(BuildContext context) => const DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TabBar(
                labelStyle: textBoldB,
                labelColor: Colors.black,
                dividerColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                ),
                tabs: [
                  Tab(text: 'Login'),
                  Tab(text: 'Signup'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content for Tab 1
                  Login(),
                  // Content for Tab 2
                  Signup(),

                  // Content for Tab 3
                ],
              ),
            ),
          ],
        ),
      );
}
