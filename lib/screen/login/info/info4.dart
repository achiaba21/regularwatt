import 'package:flutter/material.dart';
import 'package:regular_watt/screen/login/info/info5.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:regular_watt/widget/input_type.dart';

class Info4Screen extends StatefulWidget {
  const Info4Screen({super.key});

  @override
  State<Info4Screen> createState() => _Info4ScreenState();
}

class _Info4ScreenState extends State<Info4Screen> {
  final _spaceinput = 32.0;
  final String _tite = "Adresse du logement";
  final String _indication =
      "La météo impacte directement votre consommation. Notre analyse la prend en compte !";
  final _controller1 = TextEditingController();
  // final _controller2 = TextEditingController();
  // final _controller3 = TextEditingController();
  // final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  // final _controller1 = TextEditingController();
  // final _controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: white,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                label: const Text(
                  "Retour",
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _tite,
                style: const TextStyle(
                  color: white,
                  fontSize: miniSousTitre,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Hero(
                tag: 'id',
                child: LinearProgressIndicator(
                  minHeight: 10,
                  backgroundColor: white,
                  color: green,
                  value: 0.6,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                _indication,
                style: const TextStyle(
                  color: white,
                  fontSize: normalText,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InputType(
                label: "Adresse Postale",
                placeHolder: "Cocody",
                dateType: false,
                controller: _controller1,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Complément d'adresse (Facultatif)",
                placeHolder: "II Plateau Vallon",
                dateType: false,
                controller: _controller5,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Code Postal",
                placeHolder: "75008, Abidjan 8ème",
                dateType: false,
                controller: _controller6,
              ),

              //const Spacer(),
              const SizedBox(
                height: 32,
              ),
              GreenButton(
                  text: "Suivant",
                  onpress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const Info5Screen();
                        },
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
