import 'package:flutter/material.dart';
import 'package:regular_watt/utils/colors.dart';

showbars(BuildContext context,
    {String message = "Veuillez remplir tout les champs :( !!!"}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: EdgeInsets.all(0),
      duration: const Duration(seconds: 2),
      backgroundColor: green,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            message,
            style: const TextStyle(color: background),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
            },
            child: const Text('ok', style: TextStyle(color: background)),
          ),
        ],
      )));
}
