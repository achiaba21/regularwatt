import 'package:flutter/material.dart';
import 'package:regular_watt/model/person.dart';
import 'package:regular_watt/screen/main_menu/home.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/utils/function.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:regular_watt/widget/input_type.dart';

class Info5Screen extends StatefulWidget {
  const Info5Screen({super.key});

  @override
  State<Info5Screen> createState() => _Info5ScreenState();
}

class _Info5ScreenState extends State<Info5Screen> {
  final _spaceinput = 32.0;
  final String _tite = "Informations personnelles";
  final String indication =
      "Pour une meilleure prise en charge, nous avons besoin d'en savoir un peu plus sur vous.";
  final _controller1 = TextEditingController();
  // final _controller2 = TextEditingController();
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
                  value: 0.8,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                indication,
                style: const TextStyle(color: white, fontSize: normalText),
              ),
              const SizedBox(
                height: 16,
              ),
              InputType(
                label: "Nom",
                placeHolder: "Exemple: Konan",
                dateType: false,
                controller: _controller1,
              ),

              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Prénom",
                placeHolder: "Exemple: Jean Marcel",
                dateType: false,
                controller: _controller3,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Date de naissance",
                placeHolder: "Exemple: 06/10/1990",
                dateType: true,
                controller: _controller4,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Adresse e-mail",
                placeHolder: "Exemple: jean.konan@email.com",
                dateType: false,
                controller: _controller5,
              ),
              SizedBox(
                height: _spaceinput,
              ),
              InputType(
                label: "Téléphone",
                placeHolder: "+225 07 00 00 00 00",
                dateType: false,
                controller: _controller6,
                isNumber: true,
              ),

              //const Spacer(),
              const SizedBox(
                height: 32,
              ),
              GreenButton(
                text: "Suivant",
                onpress: () {
                  final nom = _controller1.text.trim();
                  final prenom = _controller3.text.trim();
                  final dateN = _controller4.text.trim();
                  final mail = _controller5.text.trim();
                  final phone = _controller6.text.trim();
                  if (nom.length < 3 ||
                      prenom.length < 3 ||
                      dateN.isEmpty ||
                      mail.length < 3 ||
                      !mail.contains("@")) {
                    showbars(context);

                    return;
                  }
                  if (phone.length < 8) {
                    showbars(context,
                        message: "Entrer un numero avec plus de 8 chiffres");
                    return;
                  }
                  Person user = Person(
                      nom: nom,
                      prenom: prenom,
                      dateNaissance: dateN,
                      mail: mail,
                      phone: phone);
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return HomeScreen(user: user);
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
