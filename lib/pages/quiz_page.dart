import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/topic_model.dart';
import 'package:flutter_quiz_app/pages/question_desc_page.dart';

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
        title: const Text('QuizPage'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
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
                          'Continue to question ${details.stepIndex + 2}',
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
        ],
      ),
      bottomNavigationBar: Container(
        child: currentStep + 1 == questions.length
            ? Container(
                height: 56,
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final correctQuestions = questions.where(
                          (element) =>
                              element.choosenAnswer == element.answer &&
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
                                  style: const TextStyle(fontSize: 30),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Show correction'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Finish Quiz'),
                ),
              )
            : Container(
                height: 0,
              ),
      ),
    );
  }
}
