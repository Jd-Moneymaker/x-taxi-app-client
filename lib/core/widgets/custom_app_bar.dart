import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = 'UBER',
    this.showBackButton = false,
  });

  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          padding: const EdgeInsets.only(top: 40, bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: AppBar(
            toolbarHeight: 60,
            centerTitle: false,
            backgroundColor: Colors.white,
            leading: showBackButton
                ? IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  )
                : null,
            title: Text(
              title,
              style: textBoldB.copyWith(fontSize: 24),
            ),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(110); // Taller app bar height
}
