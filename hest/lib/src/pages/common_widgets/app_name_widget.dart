import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  final Color? textTitleColor;
  final double textTitleSize;

  const AppNameWidget({
    Key? key,
    this.textTitleColor,
    this.textTitleSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          color: textTitleColor ?? Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: textTitleSize,
        ),
        children: const [
          TextSpan(text: 'he'),
          TextSpan(text: '.'),
          TextSpan(text: 'st'),
        ],
      ),
    );
  }
}
