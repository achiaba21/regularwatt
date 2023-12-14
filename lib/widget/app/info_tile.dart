import 'package:flutter/material.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    String message =
        "Le lorem ipsum (également appelé faux-texte, lipsum, ou bolo bolo1) est, en imprimerie, ";
    return Container(
      width: 300,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: tileFond,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                color: white,
                child: const Text("Aujourd'hui"),
              ),
              const Text(
                "Normal",
                style: TextStyle(color: green, fontSize: information),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            message,
            style: const TextStyle(color: white),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
