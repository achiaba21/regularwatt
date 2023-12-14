import 'package:flutter/material.dart';
import 'package:regular_watt/screen/login/login3.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/utils/function.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:regular_watt/widget/numero.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  String id = "+225";
  final numberControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const String localTitre =
        """Entrer votre numéro de téléphone pour continuer""";
    const text =
        """Un OTP à 4 chiffres sera envoyé par SMS pour vérifier votre numéro de téléphone.""";
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 100, bottom: 40, left: 46, right: 25),
          width: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: background,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/logo/logo.png",
                width: 75,
              ),
              const SizedBox(
                height: 75,
              ),
              const Text(
                localTitre,
                style: TextStyle(
                  color: white,
                  fontSize: titre,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                text,
                style: TextStyle(
                  color: white,
                  fontSize: normalText,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NumeroInput(
                    controller: numberControler,
                    setId: (idt) {
                      id = idt;
                      print(id);
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GreenButton(
                    text: "Envoyer OTP",
                    horizontale: 48,
                    onpress: () {
                      final text = numberControler.text;
                      final idt = id;
                      print(idt);
                      if (text.trim().length <= 9) {
                        showbars(context,
                            message: "Entrez un numero a 10 chiffres");
                        return;
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Login3Screen(number: text, id: idt);
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
