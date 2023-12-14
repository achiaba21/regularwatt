import 'package:flutter/material.dart';
import 'package:regular_watt/screen/login/info/info2.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:regular_watt/widget/info_box.dart';

class Info1Screen extends StatelessWidget {
  const Info1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    String texte =
        "Sélectionner le type d compteur et le mode de suivi pour commencer la configuration.";
    return Scaffold(
      backgroundColor: background,
      body: Container(
        padding:
            const EdgeInsets.only(top: 75, bottom: 25, left: 25, right: 25),
        child: Column(
          children: [
            Image.asset(
              "assets/logo/logo_name.png",
              width: 175,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              texte,
              style: const TextStyle(color: white, fontSize: normalText),
            ),
            const SizedBox(
              height: 32,
            ),
            const InfoBox(
              titre_: "Type de compteur",
              text1: "Compteur analogique",
              text2: "Compteur numérique",
            ),
            const SizedBox(
              height: 32,
            ),
            const InfoBox(
              titre_: "Mode de suivi",
              text1: "Suivi manuel",
              text2: "Suivi en temps réel",
            ),
            const Spacer(),
            GreenButton(
                text: "Débloquer mon suivi conso",
                onpress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return const Info2Screen();
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
