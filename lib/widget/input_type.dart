import 'package:flutter/material.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';

class InputType extends StatefulWidget {
  const InputType({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.dateType,
    required this.controller,
    this.isNumber = false,
  });
  final String label;
  final bool isNumber;
  final String placeHolder;
  final TextEditingController controller;

  final bool dateType;
  @override
  State<InputType> createState() => _InputTypeState();
}

class _InputTypeState extends State<InputType> {
  @override
  void dispose() {
    super.dispose();
  }

  void setDate() async {
    final now = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year + 1),
    );
    if (selectedDate == null) {
      return;
    }
    setState(() {
      widget.controller.text =
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 8),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: white,
              fontSize: information,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            border: Border.all(
              color: white,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: SizedBox(
            width: 150,
            child: TextField(
              keyboardType: widget.isNumber ? TextInputType.number : null,
              readOnly: widget.dateType,
              cursorColor: white,
              controller: widget.controller,
              style: const TextStyle(
                color: white,
              ),
              decoration: InputDecoration(
                // labelText: "serge",
                alignLabelWithHint: false,
                border: InputBorder.none,
                hintText: widget.placeHolder,
                hintStyle: TextStyle(
                  color: white.withOpacity(0.5),
                  letterSpacing: 1.5,
                  fontSize: information,
                ),
                suffixIcon: widget.dateType
                    ? IconButton(
                        icon: const Icon(
                          Icons.calendar_month,
                          color: white,
                        ),
                        onPressed: setDate,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
