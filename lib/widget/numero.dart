import 'package:flutter/material.dart';
import 'package:regular_watt/model/pays_identifier.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';

class NumeroInput extends StatefulWidget {
  const NumeroInput({super.key, required this.controller, required this.setId});
  final TextEditingController controller;
  final void Function(String id) setId;

  @override
  State<NumeroInput> createState() => _NumeroInputState();
}

class _NumeroInputState extends State<NumeroInput> {
  final List<PayIdentifier> _pays = [
    const PayIdentifier(id: "+225", logo: "assets/flags/ci.png"),
    const PayIdentifier(id: "+33", logo: "assets/flags/fr.png"),
    const PayIdentifier(id: "+229", logo: "assets/flags/ml.png"),
    const PayIdentifier(id: "+226", logo: "assets/flags/bf.png"),
  ];

  late PayIdentifier pays;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pays = _pays.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: whitegray),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<PayIdentifier>(
            underline: const SizedBox(),
            icon: const Icon(
              Icons.expand_more,
              color: white,
            ),
            value: pays,
            dropdownColor: background,
            items: _pays
                .map<DropdownMenuItem<PayIdentifier>>(
                  (pay) => DropdownMenuItem<PayIdentifier>(
                    value: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          pay.logo,
                          width: 25,
                          height: 25,
                        ),
                        Text(
                          pay.id,
                          style: const TextStyle(
                            color: white,
                            fontSize: information,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            onChanged: (pay) {
              if (pay == null) {
                return;
              }
              setState(() {
                pays = pay;
                widget.setId(pays.id);
              });
            },
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 120,
            child: TextField(
              controller: widget.controller,
              maxLength: 10,
              style: const TextStyle(
                color: white,
                fontSize: information,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                  hintText: "Numéro de téléphone",
                  hintStyle: TextStyle(
                    color: white,
                  )),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
