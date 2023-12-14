import 'package:flutter/material.dart';
import 'package:regular_watt/screen/login/login2.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';

class Login1Screen extends StatelessWidget {
  const Login1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    String text =
        """Accéder à votre compte grâce à votre numéro de téléphone pour suivre votre consommation, et gérer vos factures""";

    final conditions = [
      "En cliquant sur le bouton Se connecter, vous acceptez ",
      "les conditions générales",
      " d'utilisation de l'application. "
    ];
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 100, bottom: 40, left: 46, right: 25),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo/logo_name.png",
              width: 175,
            ),
            const SizedBox(
              height: 75,
            ),
            const Text(
              "Êtes-vous client ?",
              style: TextStyle(
                color: white,
                fontSize: titre,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              text,
              softWrap: true,
              style: const TextStyle(
                fontSize: normalText,
                color: white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) {
                      return const Login2Screen();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Text(
                "Se connecter",
                style: TextStyle(
                  fontSize: button,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                text: conditions[0],
                children: [
                  TextSpan(
                      text: conditions[1],
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      )),
                  TextSpan(
                    text: conditions[2],
                  ),
                ],
              ),
              style: const TextStyle(fontSize: information, color: white),
            ),
          ],
        ),
      ),
    );
  }
}
