class TopicModel {
  final List<QuestionModel>? questionModel;
  final String? subject;
  final String? subTopic;
  final TopicDescriptionModel? instructions;
  double? rating;

  TopicModel({
    required this.questionModel,
    required this.subject,
    required this.subTopic,
    required this.instructions,
    this.rating,
  });
}

class TopicDescriptionModel {
  final List<String?> instruction;
  final String time;
  final String? points;

  TopicDescriptionModel({
    required this.time,
    required this.points,
    required this.instruction,
  });
}

class QuestionModel {
  String question;
  List<String> answers;
  String answerDescription;
  String answer;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.answerDescription,
    required this.answer,
  });
}

List<TopicModel> QUESTIONS = [
  //ui/ux
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'What is ui/ux?',
        answers: [
          "User interface",
          'User interaction',
          'User Experience',
          'User interface / User experience',
        ],
        answerDescription: 'ui/ux stands for User interface / User experience',
        answer: 'User interface / User experience',
      ),
      QuestionModel(
        question: 'What is ui/ux (question 2) ?',
        answers: [
          "User interface",
          'User interaction',
          'User Experience',
          'User interface / User experience',
        ],
        answerDescription: 'ui/ux stands for User interface / User experience',
        answer: 'User interface / User experience',
      ),
      QuestionModel(
        question: 'What is ui/ux (question 3) ?',
        answers: [
          "User interface",
          'User interaction',
          'User Experience',
          'User interface / User experience',
        ],
        answerDescription: 'ui/ux stands for User interface / User experience',
        answer: 'User interface / User experience',
      ),
    ],
    subject: 'Computer',
    subTopic: 'UI/UX',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all UI/UX questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
  //flutter
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'What is Flutter?',
        answers: [
          "Programming language",
          'French quizine',
          'Street name',
          'Book Author',
        ],
        answerDescription: 'Flutter is programming language created by google',
        answer: 'Programming language',
      ),
      QuestionModel(
        question: 'What is Flutter(question 2)?',
        answers: [
          "Programming language",
          'French quizine',
          'Street name',
          'Book Author',
        ],
        answerDescription: 'Flutter is programming language created by google',
        answer: 'Programming language',
      ),
      QuestionModel(
        question: 'What is Flutter(question 3)?',
        answers: [
          "Programming language",
          'French quizine',
          'Street name',
          'Book Author',
        ],
        answerDescription: 'Flutter is programming language created by google',
        answer: 'Programming language',
      ),
    ],
    subject: 'Computer',
    subTopic: 'Flutter',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all flutter questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
  //Javascript
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'What IDE can you use for writing javascript code?',
        answers: [
          'VS code',
          'Android Studio',
          'Intellij',
          'All of the above',
        ],
        answerDescription: 'All can be used to write JS code',
        answer: 'All of the above',
      ),
      QuestionModel(
        question:
            'What IDE can you use for writing javascript code(question 2)?',
        answers: [
          'VS code',
          'Android Studio',
          'Intellij',
          'All of the above',
        ],
        answerDescription: 'All can be used to write JS code',
        answer: 'All of the above',
      ),
      QuestionModel(
        question:
            'What IDE can you use for writing javascript code (question 3) ?',
        answers: [
          'VS code',
          'Android Studio',
          'Intellij',
          'All of the above',
        ],
        answerDescription: 'All can be used to write JS code',
        answer: 'All of the above',
      ),
    ],
    subject: 'Computer',
    subTopic: 'JavaScript',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all javascript questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
  //Anatomy
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'Which of the following arteries does not supply the scalp?',
        answers: [
          'Frontal artery',
          'Temporal artery',
          'Gleno-humeral artery',
          'Brachial artery',
        ],
        answerDescription: 'Brachial artery',
        answer: 'Brachial artery',
      ),
      QuestionModel(
        question:
            'Which of the following arteries does not supply the scalp(Q2)?',
        answers: [
          'Frontal artery',
          'Temporal artery',
          'Gleno-humeral artery',
          'Brachial artery',
        ],
        answerDescription: 'Brachial artery',
        answer: 'Brachial artery',
      ),
      QuestionModel(
        question:
            'Which of the following arteries does not supply the scalp(Q3)?',
        answers: [
          'Frontal artery',
          'Temporal artery',
          'Gleno-humeral artery',
          'Brachial artery',
        ],
        answerDescription: 'Brachial artery',
        answer: 'Brachial artery',
      ),
    ],
    subject: 'Science',
    subTopic: 'Anatomy',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all anatomy questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
  //Physiology
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'What is the most abundant anion in the human body?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
      QuestionModel(
        question: 'What is the most abundant anion in the human body(Q2)?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
      QuestionModel(
        question: 'What is the most abundant anion in the human body(Q3)?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
    ],
    subject: 'Science',
    subTopic: 'Physiology',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all physiology questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
  //Medical Microbiology
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'Which of these is not healthy?',
        answers: [
          'LDL',
          'HDL',
          'Cholesterol',
          'Glucose',
        ],
        answerDescription: 'LDL',
        answer: 'LDL',
      ),
      QuestionModel(
        question: 'Which of these is not healthy(Q2)?',
        answers: [
          'LDL',
          'HDL',
          'Cholesterol',
          'Glucose',
        ],
        answerDescription: 'LDL',
        answer: 'LDL',
      ),
      QuestionModel(
        question: 'Which of these is not healthy(Q3)?',
        answers: [
          'LDL',
          'HDL',
          'Cholesterol',
          'Glucose',
        ],
        answerDescription: 'LDL',
        answer: 'LDL',
      ),
    ],
    subject: 'Science',
    subTopic: 'Medical Microbiology',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all Medical Microbiology questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),

  //Painting
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'Which of the following arteries does not supply the scalp?',
        answers: [
          'Frontal artery',
          'Temporal artery',
          'Gleno-humeral artery',
          'Brachial artery',
        ],
        answerDescription: 'Brachial artery',
        answer: 'Brachial artery',
      ),
      QuestionModel(
        question:
            'Which of the following arteries does not supply the scalp(Q2)?',
        answers: [
          'Frontal artery',
          'Temporal artery',
          'Gleno-humeral artery',
          'Brachial artery',
        ],
        answerDescription: 'Brachial artery',
        answer: 'Brachial artery',
      ),
      QuestionModel(
        question:
            'Which of the following arteries does not supply the scalp(Q3)?',
        answers: [
          'Frontal artery',
          'Temporal artery',
          'Gleno-humeral artery',
          'Brachial artery',
        ],
        answerDescription: 'Brachial artery',
        answer: 'Brachial artery',
      ),
    ],
    subject: 'Artistry',
    subTopic: 'Painting',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all painting questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
  //Pottery
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'What is the most abundant anion in the human body?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
      QuestionModel(
        question: 'What is the most abundant anion in the human body(Q2)?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
      QuestionModel(
        question: 'What is the most abundant anion in the human body(Q3)?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
      QuestionModel(
        question: 'What is the most abundant anion in the human body(Q3)?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
      QuestionModel(
        question: 'What is the most abundant anion in the human body(Q3)?',
        answers: [
          'Sodium',
          'Potassium',
          'Calcium',
          'Zinc',
        ],
        answerDescription: 'Sodium',
        answer: 'Sodium',
      ),
    ],
    subject: 'Artistry',
    subTopic: 'Pottery',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all pottery questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
  //Medical Microbiology
  TopicModel(
    questionModel: [
      QuestionModel(
        question: 'Which of these is not healthy?',
        answers: [
          'LDL',
          'HDL',
          'Cholesterol',
          'Glucose',
        ],
        answerDescription: 'LDL',
        answer: 'LDL',
      ),
      QuestionModel(
        question: 'Which of these is not healthy?',
        answers: [
          'LDL',
          'HDL',
          'Cholesterol',
          'Glucose',
        ],
        answerDescription: 'LDL',
        answer: 'LDL',
      ),
      QuestionModel(
        question: 'Which of these is not healthy(Q2)?',
        answers: [
          'LDL',
          'HDL',
          'Cholesterol',
          'Glucose',
        ],
        answerDescription: 'LDL',
        answer: 'LDL',
      ),
      QuestionModel(
        question: 'Which of these is not healthy(Q3)?',
        answers: [
          'LDL',
          'HDL',
          'Cholesterol',
          'Glucose',
        ],
        answerDescription: 'LDL',
        answer: 'LDL',
      ),
    ],
    subject: 'Artistry',
    subTopic: 'Fine Art',
    instructions: TopicDescriptionModel(
      time: '30 mins',
      points: '10',
      instruction: [
        'Please answer all fine art questions',
        'Second instruction',
        'Third instruction',
        'Fourth instruction',
      ],
    ),
  ),
];
