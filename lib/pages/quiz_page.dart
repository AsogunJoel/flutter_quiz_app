import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../models/topic_model.dart';

class QuizQuestionsPage extends StatefulWidget {
  const QuizQuestionsPage({super.key});

  @override
  State<QuizQuestionsPage> createState() => _QuizQuestionsPageState();
}

class _QuizQuestionsPageState extends State<QuizQuestionsPage> {
  late List<QuestionModel> questions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    questions = routeArgs['Questions'];
  }

  String indexToLetters(int index) {
    var letters = '';
    do {
      final r = index % 26;
      letters = '${String.fromCharCode(64 + r)}$letters';
      index = (index - r) ~/ 26;
    } while (index > 0);
    return letters;
  }

  int currentStep = 0;
  String selectedAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Quiz Page",
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  physics: const NeverScrollableScrollPhysics(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    if (currentStep < questions.length - 1) {
                      setState(() {
                        currentStep++;
                      });
                    }
                  },
                  controlsBuilder: (context, details) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        if (currentStep > 0)
                          OutlinedButton(
                            onPressed: details.onStepCancel,
                            child: const Text('Previous'),
                          ),
                        if (currentStep + 1 < questions.length)
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: Text(
                              'Next question ${details.stepIndex + 2}',
                            ),
                          ),
                      ],
                    );
                  },
                  onStepCancel: () {
                    if (currentStep > 0) {
                      setState(() {
                        currentStep--;
                      });
                    }
                  },
                  type: StepperType.horizontal,
                  onStepTapped: (value) {
                    setState(() {
                      currentStep = value;
                    });
                  },
                  steps: List.generate(
                    questions.length,
                    (index) => Step(
                      isActive: currentStep == index,
                      title: Container(),
                      content: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions[index].question,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      questions[index].choosenAnswer =
                                          questions[index].answers[i];
                                    });
                                  },
                                  leading: CircleAvatar(
                                    maxRadius: 16,
                                    backgroundColor:
                                        questions[index].choosenAnswer ==
                                                questions[index].answers[i]
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                    child: Text(
                                      indexToLetters(i + 1),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    questions[index].answers[i],
                                  ),
                                );
                              },
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 5),
                              itemCount: questions[index].answers.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: currentStep + 1 == questions.length
                    ? Center(
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final correctQuestions = questions.where(
                                    (element) =>
                                        element.choosenAnswer ==
                                            element.answer &&
                                        element.choosenAnswer.isNotEmpty,
                                  );
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Score sheet',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Divider(),
                                          Text(
                                            '${correctQuestions.length} /${questions.length}',
                                            style:
                                                const TextStyle(fontSize: 30),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child:
                                                const Text('Show correction'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text('Submit Quiz'),
                          ),
                        ),
                      )
                    : Container(height: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
