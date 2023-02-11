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
  // double changingLinePosition() {
  //   switch (currentPage) {
  //     case 0:
  //       return 10;
  //     case 1:
  //       return 88;
  //     case 2:
  //       return 165;
  //     default:
  //       return 0;
  //   }
  // }

  //
  // double changingContainerSize() {
  //   switch (currentPage) {
  //     case 0:
  //       return 60;
  //     case 1:
  //       return 60;
  //     case 2:
  //       return 60;
  //     default:
  //       return 0;
  //   }
  // }

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
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: size.width,
                      height: size.height * 0.045,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: subjects.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => setState(() {
                            currentPage = index;
                          }),
                          child: Container(
                            // duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              children: [
                                Expanded(
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
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: currentPage == index ? 5 : 0,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff8981B3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),
            // const BuildHorizontalSlide(),
            /* MAIN BODY SECTION */
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                shrinkWrap: true,
                itemCount: subjects[currentPage].subTopic.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemBuilder: (BuildContext context, int index) =>
                    AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: currentPage == index
                          ? const Color(0xff8881B2)
                          : Colors.white54,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RecentQuizCardWidget(
                      icon: subjects[currentPage].icon,
                      iconcolor: subjects[currentPage].color,
                      subjectsModel: subjects[currentPage].subTopic[index],
                    ),
                  ),
                ),
              ),
            ),
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
