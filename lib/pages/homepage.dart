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

  PageController pageController = PageController();

  // CHANGING BOTTOM LINE
  double changingLinePosition() {
    switch (currentPage) {
      case 0:
        return 10;
      case 1:
        return 88;
      case 2:
        return 165;
      default:
        return 0;
    }
  }

  //
  double changingContainerSize() {
    switch (currentPage) {
      case 0:
        return 80;
      case 1:
        return 65;
      case 2:
        return 60;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            /* HEADER SECTION */
            headerWidget(),

            /* SUBJECT HORIZONTAL LISTVIEW SECTION */
            SizedBox(
              width: size.width,
              height: size.height * 0.05,
              // color: Colors.red,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.04,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: subjects.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => setState(() {
                            currentPage = index;
                          }),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: currentPage == 0 ? 30 : 23, top: 7),
                            child: Text(
                              subjects[index].subject,
                              style: TextStyle(
                                fontSize: currentPage == index ? 16 : 14,
                                fontWeight: currentPage == index
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //
                  AnimatedPositioned(
                    bottom: 0,
                    left: changingLinePosition(),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(left: 17),
                      duration: const Duration(milliseconds: 500),
                      height: size.height * 0.008,
                      width: changingContainerSize(),
                      decoration: BoxDecoration(
                        color: const Color(0xff8981B3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            // const BuildHorizontalSlide(),
            Text(
              '$currentPage Quiz',
              style: const TextStyle(fontSize: 20),
            ),

            /* MAIN BODY SECTION */
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: subjects.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                itemBuilder: (BuildContext context, int currentPage) => Card(
                  // elevation: currentCard == index ? 4 : 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: currentPage == currentPage
                          ? const Color(0xff8881B2)
                          : Colors.white54,
                      width: 3,
                    ),
                  ),
                  child: RecentQuizCardWidget(
                    subjectsModel: subjects[currentPage],
                  ),
                ),
              ),
            ),
            //
          ],
        ),
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
}
