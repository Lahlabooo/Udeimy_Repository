import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants_app/Modules/CahtPage.dart';
import 'package:plants_app/Modules/HomePage.dart';
import 'package:plants_app/Modules/ScannPage.dart';
import 'package:plants_app/Modules/StartedPage.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int CIndex = 0;
  var screen = [
    HomeScreen(),
    ScannScreen(),
    ChatScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.robot),label: ""),
          //BottomNavigationBarItem(icon: Icon(Icons.accessibility_rounded),label: "a"),

        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: CIndex,
        showSelectedLabels: false,
        backgroundColor: Colors.grey.withOpacity(0.1),
        fixedColor: Colors.green,
        unselectedItemColor: Colors.white54,
        // selectedIconTheme: IconThemeData(color: CupertinoColors.white),
        iconSize: 30,
        //selectedItemColor: Colors.green,
        onTap: (index){
          setState(() {
            CIndex = index;
          });
        },

      ),
      body: screen[CIndex],

    );
  }
}
