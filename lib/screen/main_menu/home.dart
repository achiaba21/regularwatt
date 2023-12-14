import 'package:flutter/material.dart';
import 'package:regular_watt/model/person.dart';
import 'package:regular_watt/utils/colors.dart';
import 'package:regular_watt/utils/font_size.dart';
import 'package:regular_watt/widget/app/dashbord.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      this.user = const Person(
          nom: "Aba", phone: "", dateNaissance: "", mail: "", prenom: "")});
  final Person user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  void setSelectedIndex(value) {
    setState(() {
      //print(value);
      index = value;
    });
  }

  late final List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      Dashbord(
        user: widget.user,
      ),
      const Center(
        child: Icon(
          Icons.signal_cellular_alt,
          color: white,
        ),
      ),
      const Center(
        child: Icon(
          Icons.sms,
          color: white,
        ),
      ),
      const Center(
        child: Icon(
          Icons.settings,
          color: white,
        ),
      ),
    ];
  }

  Color _getActive(int index, int pos) {
    return index == pos ? green : white;
  }

  @override
  Widget build(BuildContext context) {
    final mainContent = _widgetOptions[index];
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: background,
        body: mainContent,
        bottomNavigationBar: BottomNavigationBar(
          
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                backgroundColor: background,
                label: '',
                icon: Column(
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        color: _getActive(index, 0),
                        fontSize: information,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      fill: 1,
                      size: 12,
                      color: _getActive(index, 0),
                    ),
                  ],
                )),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.signal_cellular_alt,
                color: _getActive(index, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.sms,
                color: _getActive(index, 2),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.settings,
                color: _getActive(index, 3),
              ),
            )
          ],
          onTap: setSelectedIndex,
        ),
      ),
    );
  }
}
