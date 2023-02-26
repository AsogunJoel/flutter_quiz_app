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
    return Scaffold(
      body: SizedBox(
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
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                width: size.width,
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: liveSubjects.length,
                  itemBuilder: (context, index) => GestureDetector(
                    key: ValueKey(liveSubjects[index].subject),
                    onTap: () => setState(
                      () {
                        currentPage = index;
                        liveCurrentPage = -1;
                      },
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        children: [
                          Text(
                            liveSubjects[index].subject,
                            style: TextStyle(
                              fontSize: currentPage == index ? 17 : 16,
                              fontWeight: currentPage == index
                                  ? FontWeight.bold
                                  : FontWeight.w200,
                            ),
                          ),
                          const SizedBox(height: 5),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: currentPage == index ? 4 : 0,
                            width: 65,
                            decoration: BoxDecoration(
                              color: const Color(0xff8981B3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /* QUIZ SECTION */
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* RECENT QUIZ SECTION */
                    const TitleWidget(text: 'Recent Quiz'),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: recentSubjects.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: RecentQuizCardWidget(
                              subjectsModel:
                                  recentSubjects[recentCurrentPage].subTopic,
                              color: recentSubjects[recentCurrentPage].color,
                              icon: recentSubjects[recentCurrentPage].icon,
                              iconColor:
                                  recentSubjects[recentCurrentPage].iconColor,
                            ),
                          ),
                        );
                      },
                    ),
                    /* LIVE QUIZ SECTION */
                    const SizedBox(height: 10),
                    const TitleWidget(text: 'Live Quiz'),
                    LiveQuiz(
                      liveSubject: liveSubjects[currentPage],
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

class LiveQuiz extends StatelessWidget {
  const LiveQuiz({super.key, required this.liveSubject});
  final LiveSubjectsModel liveSubject;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      itemCount: liveSubject.subTopic.length,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index1) => GestureDetector(
          // onTap: ()
          // => setState(() {
          //       liveCurrentPage = index1;
          //     }),
          child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            // border:
            //     // liveCurrentPage == index1
            //     //     ?
            //     Border.all(color: const Color(0xff8881B2), width: 2),
            // // : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Card(
            elevation: 3,
            color:
                // liveCurrentPage == index1
                //     ?
                Colors.white,
            // : Colors.white.withOpacity(0.8),
            margin: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: LiveQuizCardWidget(
              icon: liveSubject.icon[index1],
              iconColor: liveSubject.iconColor,
              subjectsModel: liveSubject.subTopic[index1],
              color: liveSubject.color,
              rating: liveSubject.rating[index1],
              numQuestion: liveSubject.numQuestion[index1],
              peopleCount: liveSubject.peopleCount[index1],
            ),
          ),
        ),
      )),
    );
  }
}
