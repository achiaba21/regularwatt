import 'package:flutter/material.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    super.key,
    required this.text,
    this.horizontale = 0,
    required this.onpress,
    this.alpha = 255,
  });
  final String text;
  final double horizontale;
  final void Function() onpress;
  final int alpha;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: green.withAlpha(alpha),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontale),
        child: Text(
          text,
          style: TextStyle(
            fontSize: button,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
