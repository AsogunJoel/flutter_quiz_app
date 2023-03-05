import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/topic_model.dart';
import 'package:flutter_quiz_app/pages/quiz_page.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/bottom_sheet_widget.dart';

class QuestionDescriptionPage extends StatefulWidget {
  const QuestionDescriptionPage({Key? key}) : super(key: key);

  @override
  State<QuestionDescriptionPage> createState() =>
      _QuestionDescriptionPageState();
}

class _QuestionDescriptionPageState extends State<QuestionDescriptionPage> {
  late TopicModel? topic;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['title'];
    topic = QUESTIONS.firstWhere(
      (element) => element.subTopic == id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Quiz Detail",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(
                Ionicons.person_outline,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xff8981B3),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${topic!.subTopic} Quiz',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                      ),
                    ),
                    const Text(
                      'Get 100 Points',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      '1.5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.star_outlined,
                      color: Color(0xffFFBD6C),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: BottomSheetCustomWidget(
                topic: topic!,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 43,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const QuizQuestionsPage(),
                    settings: RouteSettings(
                      arguments: {'Questions': topic!.questionModel},
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8981B3),
              ),
              child: const Text('Start Quiz'),
            ),
          ),
        ),
      ),
    );
  }
}
