
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/green_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class Compteur extends StatefulWidget {
  const Compteur({
    super.key,
    this.maxValue = 1.1,
    this.minValue = 0,
  });

  final double maxValue;
  final double minValue;

  @override
  State<Compteur> createState() => _CompteurState();
}

class _CompteurState extends State<Compteur> {
  double value = 0.45;
  void genererConso(values) {
    setState(() {
      //value = Random().nextDouble() * 1.1;
      value = values;
      //print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    const double espacement = 12;
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 1000,
      axes: <RadialAxis>[
        RadialAxis(
          onAxisTapped: (value) {
            genererConso(value);
            //print(value);
          },
          startAngle: 160,
          endAngle: 20,
          axisLineStyle: const AxisLineStyle(
            //gradient: ,
            thickness: 30,
            dashArray: [12, 10],
            cornerStyle: CornerStyle.bothCurve,
            // gradient: LinearGradient(colors: [white])
          ),
          minimum: widget.minValue,
          maximum: widget.maxValue,
          showLabels: false,
          showFirstLabel: false,
          showTicks: false,
          pointers: <GaugePointer>[
            RangePointer(
              enableAnimation: true,
              //color: green,

              value: value,
              width: 30,
              dashArray: const [12, 10],
              gradient: SweepGradient(colors: [
                green,
                Colors.orange.shade500,
                const Color.fromARGB(255, 255, 8, 3),
              ], stops: [
                value < widget.maxValue / 4 ? 1 : 0.25,
                value <= widget.maxValue * 4 / 6 ? 1 : 0.66,
                1
              ]),
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                axisValue: 100,
                widget: SizedBox(
                  //width: 150,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        value.toStringAsFixed(2),
                        style: const TextStyle(
                          color: green,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "241 V",
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                          SizedBox(
                            width: espacement,
                          ),
                          Text(
                            "32 C",
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                          SizedBox(
                            width: espacement,
                          ),
                          Text(
                            "0.41 A",
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                angle: 90,
                positionFactor: 0),
            GaugeAnnotation(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Equipements",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: miniSousTitre,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  GreenButton(
                    text: "Détails",
                    onpress: () {
                     
                    },
                    horizontale: 24,
                  ),
                ],
              ),
              angle: 90,
              positionFactor: 0.9,
            ),
            GaugeAnnotation(
              widget: Text(
                '${widget.maxValue} kWh',
                style: const TextStyle(
                  color: white,
                ),
              ),
              angle: 27,
              positionFactor: 1,
            ),
            GaugeAnnotation(
              widget: Text(
                '${widget.minValue} kWh',
                style: const TextStyle(color: white),
              ),
              angle: 150,
              positionFactor: 0.99,
            ),
            const GaugeAnnotation(
              widget: Text(
                'kWh',
                style: TextStyle(
                  color: white,
                  fontSize: miniSousTitre,
                  fontWeight: FontWeight.bold,
                ),
              ),
              angle: 180 + 90,
              positionFactor: 0.6,
            ),
          ],
        ),
      ],
    );
  }
}


// Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         Positioned(
//             left: side,
//             bottom: bottom,
//             child: Text(
//               "$minValue",
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             )),
//         Positioned(
//             right: side,
//             bottom: bottom,
//             child: Text(
//               "$maxValue",
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             )),
//         const Positioned(
//             top: 150,
//             child: Text(
//               "Kw",
//               style: TextStyle(
//                   fontSize: 24, fontWeight: FontWeight.bold, color: white),
//             )),