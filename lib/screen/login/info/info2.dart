import 'package:flutter/material.dart';
import 'package:regular_watt/screen/login/info/info3.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:regular_watt/widget/input_type.dart';

class Info2Screen extends StatefulWidget {
  const Info2Screen({super.key});

  @override
  State<Info2Screen> createState() => _Info2ScreenState();
}

class _Info2ScreenState extends State<Info2Screen> {
  final _spaceinput = 32.0;
  final String _tite = "Paramétrage du compteur";
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
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
                  value: 0.3,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InputType(
                label: "Désignation",
                placeHolder: "Exemple : Maison ou Magasin etc",
                dateType: false,
                controller: _controller1,
              ),

              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Identifiant (Les 9 premiers chiffres)",
                placeHolder: "Exemple : 012345678",
                dateType: false,
                controller: _controller3,
                isNumber: true,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Réglages du disjoncteur",
                placeHolder: "Exemple : 10A",
                dateType: false,
                controller: _controller4,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Code tarif",
                placeHolder: "Exemple : 01 Dom social, 02 Dom général, 03 pro",
                dateType: false,
                controller: _controller5,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Exploitation",
                placeHolder: "Exemple : ABJ ou autres communes (intérieur)",
                dateType: false,
                controller: _controller6,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Types de compteur",
                placeHolder: "Exemple : Numérique ou analogique",
                dateType: false,
                controller: _controller2,
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
                          return const Info3Screen();
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
