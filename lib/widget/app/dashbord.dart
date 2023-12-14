import 'package:flutter/material.dart';
import 'package:regular_watt/model/person.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/app/info_tile.dart';
import 'package:regular_watt/widget/compteur.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key, required this.user});
  final Person user;

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  final dumy = [4, 4];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              iconColor: white,
              textColor: white,
              leading: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: whitegray,
                ),
              ),
              title: Text(
                "Hello, ${widget.user.nom}",
                style: const TextStyle(
                  color: green,
                  fontSize: miniSousTitre,
                ),
              ),
              subtitle: const Text(
                'Welcome back home',
                style: TextStyle(fontSize: information),
              ),
              trailing: const Badge(
                backgroundColor: Colors.red,
                child: Icon(Icons.notifications),
              ),
              onTap: null,
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 300,
              width: 300,
              child: Compteur(),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Regulwatt: Tension du réseau électrique",
              style: TextStyle(color: white, fontSize: information),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < dumy.length; i++)
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: InfoTile(),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              label: const Text(
                  "Personnalisez les alertes pour maitriser votre budget "),
            ),
          ],
        ),
      ),
    );
  }
}
