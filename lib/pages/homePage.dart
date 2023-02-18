import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/recent_quiz_model.dart';
import 'package:flutter_quiz_app/widgets/header.dart';
import 'package:flutter_quiz_app/widgets/liveQuizCard.dart';
import 'package:flutter_quiz_app/widgets/recentQuizCard.dart';

import '../models/live_quiz_model.dart';
import '../widgets/title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  int recentCurrentPage = 0;
  int liveCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    width: size.width,
                    height: size.height * 0.055,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: liveSubjects.length,
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
                                  liveSubjects[index].subject,
                                  style: TextStyle(
                                    fontSize: currentPage == index ? 18 : 14,
                                    fontWeight: currentPage == index
                                        ? FontWeight.bold
                                        : FontWeight.w200,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: currentPage == index ? 6 : 0,
                                width: 65,
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
          const SizedBox(height: 5),

          /* LIVE QUIZ SECTION */
          const TitleWidget(text: 'Recent Quiz'),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: recentSubjects.length,
              itemBuilder: (_, index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: RecentQuizCardWidget(
                      subjectsModel: recentSubjects[recentCurrentPage].subTopic,
                      color: recentSubjects[recentCurrentPage].color,
                      icon: recentSubjects[recentCurrentPage].icon,
                      iconColor: recentSubjects[recentCurrentPage].iconColor,
                    ),
                  ),
                );
              },
            ),
          ),

          /* RECENT QUIZ SECTION */
          const TitleWidget(text: 'Live Quiz'),
          SizedBox(
            height: 160,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              shrinkWrap: true,
              itemCount: liveSubjects[currentPage].subTopic.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index1) => GestureDetector(
                  onTap: () => setState(() {
                        currentPage == index1;
                      }),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        border: liveCurrentPage == index1
                            ? Border.all(
                                color: const Color(0xff8881B2),
                                width: 3,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        elevation: 3,
                        color: liveCurrentPage == index1
                            ? Colors.white
                            : const Color(0xffF3F3F3),
                        margin: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: LiveQuizCardWidget(
                          icon: liveSubjects[currentPage].icon[index1],
                          iconColor: liveSubjects[currentPage].iconColor,
                          subjectsModel:
                              liveSubjects[currentPage].subTopic[index1],
                          color: liveSubjects[currentPage].color,
                          rating: liveSubjects[currentPage].rating[index1],
                          numQuestion:
                              liveSubjects[currentPage].numQuestion[index1],
                          peopleCount:
                              liveSubjects[currentPage].peopleCount[index1],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
