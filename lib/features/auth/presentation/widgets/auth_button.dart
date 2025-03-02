import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/style/style.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final void Function()? onTap;
  final IconData? icon;
  final TextStyle? style;

  const AuthButton({
    super.key,
    this.borderColor,
    required this.onPressed,
    required this.title,
    required this.bgColor,
    this.onTap,
    this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textBoldW,
            ),
            const SizedBox(
              width: 4,
            ),
            SvgPicture.asset(
              'assets/svg/chevrons-right.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              height: 12,
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
