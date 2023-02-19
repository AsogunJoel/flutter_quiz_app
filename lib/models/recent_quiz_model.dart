import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentSubjectsModel {
  final String subTopic;
  final IconData icon;
  final Color? color;
  final Color? iconColor;

  RecentSubjectsModel(
    this.subTopic,
    this.icon,
    this.color,
    this.iconColor,
  );
}

/* RECENT QUIZ SUBJECTS */
List<RecentSubjectsModel> recentSubjects = [
  RecentSubjectsModel(
    'Java',
    Icons.javascript,
    const Color(0xffFFF4DB),
    const Color(0xffFFBD6C),
  ),
  // RecentSubjectsModel(
  //   'Fine Art',
  //   CupertinoIcons.rectangle_3_offgrid_fill,
  //   const Color(0xffE3FEF0),
  //   const Color(0xff49D68C),
  // ),
];
