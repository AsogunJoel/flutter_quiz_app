import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/topic_model.dart';
import 'package:ionicons/ionicons.dart';

class RecentQuizCardWidget extends StatelessWidget {
  final SubjectsModel subjectsModel;

  const RecentQuizCardWidget({
    super.key,
    required this.subjectsModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      leading: Container(
        height: 100,
        width: 60,
        color: subjectsModel.color,
        child: Icon(
          subjectsModel.icon,
          size: 35,
          color: subjectsModel.iconColor,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              subjectsModel.subTopic.join(', '),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Ionicons.trash,
              color: Colors.grey.shade300,
              size: 25,
            ),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    CupertinoIcons.news,
                    size: 17,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1/10 Questions',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Icon(
                    CupertinoIcons.clock,
                    size: 17,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '15 Mins',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
