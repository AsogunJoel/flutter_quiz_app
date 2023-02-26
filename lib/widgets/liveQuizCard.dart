import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/question_desc_page.dart';

class LiveQuizCardWidget extends StatelessWidget {
  final String? subjectsModel;
  final IconData? icon;
  final Color? iconColor;
  final Color? color;
  final int peopleCount;
  final double? rating;
  final int numQuestion;

  const LiveQuizCardWidget({
    super.key,
    required this.subjectsModel,
    required this.icon,
    required this.iconColor,
    required this.color,
    required this.peopleCount,
    required this.rating,
    required this.numQuestion,
  });

  questDecNavigator(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const QuestionDescriptionPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const QuestionDescriptionPage();
          },
          settings: RouteSettings(
            arguments: {
              'title': subjectsModel,
            },
          ),
        ),
      ),
      isThreeLine: true,
      leading: Container(
        height: 60,
        width: 60,
        color: color,
        child: Icon(icon, size: 35, color: iconColor),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subjectsModel!,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rating.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.star_outlined,
            color: Color(0xffFFBD6C),
            size: 15,
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.square_pencil,
                    size: 15,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '$numQuestion Questions',
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.person_2_alt,
                    size: 15,
                  ),
                  const SizedBox(width: 10),
                  Text('$peopleCount users playing'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
