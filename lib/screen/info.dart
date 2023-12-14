import 'package:flutter/material.dart';
import 'package:regular_watt/dummy_models/dummy_presentation.dart';
import 'package:regular_watt/model/presentation.dart';
import 'package:regular_watt/screen/login/login1.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  void changepage(int sens) {
    index += sens;
    if (index < 0) {
      index = 0;
      return;
    }
    if (index > presentations.length - 1) {
      next();
      return;
    }

    pageController = PageController(initialPage: index);
    setState(() {
      presentation = presentations[index];
    });
  }

  void next() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) {
          return const Login1Screen();
        },
      ),
    );
  }

  int index = 0;
  PageController pageController = PageController();
  Presentation presentation = presentations[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          double sens = details.velocity.pixelsPerSecond.dx;
          //print(details.velocity.pixelsPerSecond.dy);
          print(sens);
          if (!(sens > 200.5)) {
            changepage(1);
          } else if (!(sens < -50)) {
            changepage(-1);
          }
        },
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath1(),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whitegray,
                  border: Border.all(color: Colors.black),
                ),
                padding: const EdgeInsets.only(top: 80, bottom: 40),
                child: Image.asset(
                  presentation.img,
                  height: 200,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: background,
                ),
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text(
                      presentation.titre,
                      style: const TextStyle(
                        color: green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      presentation.text,
                      softWrap: true,
                      style: const TextStyle(color: white, fontSize: 16),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SmoothPageIndicator(
                              controller: pageController,
                              onDotClicked: (index) {
                                pageController =
                                    PageController(initialPage: index);
                                setState(() {
                                  presentation = presentations[index];
                                });
                              },
                              count: presentations.length,
                              effect: const ExpandingDotsEffect(
                                dotColor: green,
                                activeDotColor: green,
                                expansionFactor: 2,
                                dotWidth: 7,
                                dotHeight: 7,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: next,
                              child: const Text(
                                "Passer",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(color: green, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: green,
                            ),
                            child: IconButton(
                              onPressed: () {
                                changepage(1);
                              },
                              icon: const Icon(Icons.arrow_forward_ios_sharp),
                              iconSize: 28,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path();
    //print(h);
    // (0,0) //1 point
    path.lineTo(0, h); // 2 point
    path.quadraticBezierTo(
      w * 0.5,
      h - 25,
      w,
      h,
    ); // 4 point
    path.lineTo(w, 0); // 5 point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
