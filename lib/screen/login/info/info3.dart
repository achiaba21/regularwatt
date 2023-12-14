import 'package:flutter/material.dart';
import 'package:regular_watt/screen/login/info/info4.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:regular_watt/widget/input_type.dart';

class Info3Screen extends StatefulWidget {
  const Info3Screen({super.key});

  @override
  State<Info3Screen> createState() => _Info3ScreenState();
}

class _Info3ScreenState extends State<Info3Screen> {
  final _spaceinput = 32.0;
  final String _tite = "Information complémentaire";
  final _controller1 = TextEditingController();
  // final _controller2 = TextEditingController();
  // final _controller3 = TextEditingController();
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
                  value: 0.45,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InputType(
                label: "Index facture précédente",
                placeHolder: "Exemple : 4845 kWh",
                dateType: false,
                controller: _controller1,
                isNumber: true,
              ),

              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Date de fin bimestre précédent",
                placeHolder: "Exemple : 04/06/2023",
                dateType: true,
                controller: _controller4,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Index actuel",
                placeHolder: "Index actuel",
                dateType: false,
                controller: _controller5,
                isNumber: true,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Date du jour",
                placeHolder: "Exemple : 14/07/2023",
                dateType: true,
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
                          return const Info4Screen();
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
