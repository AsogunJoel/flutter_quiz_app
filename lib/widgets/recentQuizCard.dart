import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RecentQuizCardWidget extends StatelessWidget {
  final String? subjectsModel;
  final IconData? icon;
  final Color? iconColor;
  final Color? color;

  const RecentQuizCardWidget({
    super.key,
    required this.subjectsModel,
    required this.icon,
    required this.iconColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        isThreeLine: true,
        leading: Container(
          height: 80,
          width: 60,
          color: color,
          child: Icon(
            icon,
            size: 35,
            color: iconColor,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                subjectsModel!,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  children: const [
                    Icon(
                      CupertinoIcons.news_solid,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '1/10 Questions',
                      style: TextStyle(
                        // fontSize: 10,
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
                    SizedBox(width: 5),
                    Text(
                      '15 Mins',
                      style: TextStyle(
                        // fontSize: 17,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
