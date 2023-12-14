import 'package:flutter/material.dart';
import 'package:regular_watt/screen/login/welcom.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/utils/function.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:pinput/pinput.dart';

class Login3Screen extends StatefulWidget {
  const Login3Screen({
    super.key,
    required this.number,
    required this.id,
  });
  final String number;
  final String id;

  @override
  State<Login3Screen> createState() => _Login3ScreenState();
}

class _Login3ScreenState extends State<Login3Screen> {
  final _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int time = 14;
    const defaultTheme = PinTheme(
        width: 50,
        height: 60,
        textStyle: TextStyle(
          color: green,
          fontSize: titre,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: green,
            width: 2.0,
          )),
        ));
    const String lTitre = """Vérification OTP""";
    String text =
        """Vérifiez vos SMS. Nous vous avons envoyé le code PIN au (${widget.id}) ${widget.number.substring(0, 4)}******""";
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
                lTitre,
                style: TextStyle(
                  color: white,
                  fontSize: titre,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 32,
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
              Pinput(
                controller: _otp,
                length: 4,
                defaultPinTheme: defaultTheme,
                focusedPinTheme: defaultTheme,
                //autofillHints: Iterable.generate(4, (i) => "."),
                onChanged: (value) {
                  //print(value);
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //const NumeroInput(),

                  const SizedBox(
                    height: 24,
                  ),
                  GreenButton(
                    text: "Send OTP",
                    horizontale: 48,
                    onpress: () {
                      final texte = _otp.text;
                      if (texte.trim().length != 4) {
                        showbars(context);
                        return;
                      }
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const Welcom();
                      }));
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Renvoyer le code dans 0:$time",
                style: const TextStyle(color: white, fontSize: information),
              )
            ],
          ),
        ),
      ),
    );
  }
}
