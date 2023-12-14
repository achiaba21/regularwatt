import 'package:flutter/material.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/green_button.dart';

class InfoBox extends StatefulWidget {
  const InfoBox(
      {super.key,
      required this.titre_,
      required this.text1,
      required this.text2});
  final String titre_;
  final String text1;
  final String text2;

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: whitegray,
      ),
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.titre_,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: background,
                fontWeight: FontWeight.bold,
                fontSize: miniSousTitre,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GreenButton(
                text: widget.text1,
                onpress: () {
                  setState(() {
                    index = 0;
                  });
                },
                alpha: index == 0 ? 255 : 100),
            const SizedBox(
              height: 12,
            ),
            GreenButton(
                text: widget.text2,
                onpress: () {
                  setState(() {
                    index = 1;
                  });
                },
                alpha: index == 1 ? 255 : 100),
          ],
        ),
      ),
    );
  }
}
