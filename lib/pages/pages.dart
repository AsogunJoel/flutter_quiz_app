import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/pages/profilePage.dart';
import 'package:flutter_quiz_app/pages/resultPage.dart';
import 'package:flutter_quiz_app/pages/homePage.dart';
import 'package:ionicons/ionicons.dart';

class NavigationPages extends StatefulWidget {
  const NavigationPages({Key? key}) : super(key: key);

  @override
  State<NavigationPages> createState() => _NavigationPagesState();
}

class _NavigationPagesState extends State<NavigationPages> {
  int navIndex = 0;

  // List of navigation
  List pages = [const HomePage(), const ResultPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      // NAVIGATION SCREEN
      body: pages[navIndex],
      //  BOTTOM NAVIGATION SECTION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navIndex,
        selectedItemColor: const Color(0xff8881B2),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.ribbon_outline),
            label: "Results",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Ionicons.chatbox_ellipses_outline),
          //   label: "chat",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          ),
        ],
        onTap: (currentIndex) {
          setState(() {
            navIndex = currentIndex;
          });
        },
      ),
    );
  }
}
