import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/recentQuizCard.dart';
import 'package:ionicons/ionicons.dart';

import '../models/topic_model.dart';
import '../widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /* HEADER SECTION */
          headerWidget(),

          /* SUBJECT HORIZONTAL LISTVIEW SECTION */
          buildHorizontalSlide(),

          /* MAIN BODY SECTION */
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              /* RECENT QUIZ SECTION */
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 5),
                  Text(
                    'Recent Quiz',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Expanded(child: RecentQuizCardWidget()),
                ],
              ),
            ),
          )
        ],
      ),

      //  BOTTOM NAVIGATION SECTION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.ribbon_outline),
            label: "Award",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbox_ellipses_outline),
            label: "chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "profile",
          ),
        ],
      ),
    );
  }

  Padding buildHorizontalSlide() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  currentPage = index;
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.all(5),
                  height: 25,
                  width: 90,
                  child: Center(
                    child: Text(
                      subjects[index].subject,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: currentPage == index
                            ? Colors.black
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: currentPage == index,
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: const BoxDecoration(
                    // shape: BoxShape.circle,
                    color: Color(0xff8981B3),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
