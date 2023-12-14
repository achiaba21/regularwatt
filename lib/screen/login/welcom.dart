import 'package:flutter/material.dart';
import 'package:regular_watt/screen/info.dart';
import 'package:regular_watt/screen/login/info/info1.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/green_button.dart';

class Welcom extends StatelessWidget {
  const Welcom({super.key});

  @override
  Widget build(BuildContext context) {
    String text =
        "Bienvenue dans l'univers Regulwatt. Fini les prises de tête avec vos factures. Vous avez dorénavant le contrôle de votre consommation d'électricité.";
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          ClipPath(
              clipper: CustomClipPath1(),
              child: Container(
                height: MediaQuery.of(context).size.height * 2 / 3 - 8,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      "assets/img/african-american-man-watching-streaming-service-home copie.jpg"),
                  fit: BoxFit.cover,
                )),
              )),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Bienvenue",
                  style: TextStyle(
                    color: white,
                    fontSize: titre,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: white,
                    fontSize: normalText,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                GreenButton(
                  text: "Démarrer",
                  onpress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const Info1Screen();
                        },
                      ),
                    );
                  },
                  horizontale: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
