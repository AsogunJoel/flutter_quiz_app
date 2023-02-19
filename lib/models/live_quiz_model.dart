import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

/*
Topics we'll use are computer, science, art.
computer subtopics:
  'UI/UX'
  'Flutter'
  'JavaScript'

science subtopics:
  'Anatomy'
  'Physiology'
  'Medical Microbiology'

art subtopics:
  'Fine art'
  'Pottery'
  'Painting'

  Please not that in question below you will
  have to write questions for al the art subjects to
  get familiar with the data models.

*/

class LiveSubjectsModel {
  final String subject;
  final List<String> subTopic;
  final List<IconData> icon;
  final Color? color;
  final Color? iconColor;
  final List<int> peopleCount;
  final List<double> rating;
  final List<int> numQuestion;

  LiveSubjectsModel(
    this.subject,
    this.subTopic,
    this.icon,
    this.color,
    this.iconColor,
    this.peopleCount,
    this.rating,
    this.numQuestion,
  );
}

/* RECENT QUIZ SUBJECTS */
List<LiveSubjectsModel> liveSubjects = [
  LiveSubjectsModel(
    'Computer',
    ['UI/UX', 'Flutter', 'JavaScript'],
    [
      CupertinoIcons.device_desktop,
      Icons.flutter_dash,
      Icons.javascript,
    ],
    const Color(0xffFFF4DB),
    const Color(0xffFFBD6C),
    [1234, 203, 15],
    [1.0, 7.5, 5.1],
    [30, 20, 10],
  ),
  LiveSubjectsModel(
      'Artistry',
      ['Painting', 'Pottery', 'Fine Art'],
      [
        CupertinoIcons.paintbrush,
        CupertinoIcons.paw_solid,
        CupertinoIcons.rectangle_3_offgrid_fill,
      ],
      const Color(0xffE3FEF0),
      const Color(0xff49D68C),
      [2006, 20, 500],
      [2.1, 0.0, 5.5],
      [5, 9, 50]),
  LiveSubjectsModel(
    'Science',
    ['Anatomy', 'Physiology', 'Medical Microbiology'],
    [
      CupertinoIcons.tuningfork,
      Ionicons.book,
      Ionicons.flask_outline,
    ],
    const Color(0xffEDECFA),
    const Color(0xffA5A1C8),
    [3267, 50006, 120011],
    [3.0, 3.0, 1.2],
    [15, 10, 20],
  ),
];
