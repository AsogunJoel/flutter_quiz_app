import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/topic_model.dart';

import 'bottom_sheet_listTile_widget.dart';

class BottomSheetCustomWidget extends StatelessWidget {
  const BottomSheetCustomWidget({Key? key, required this.topic})
      : super(key: key);
  final TopicModel topic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Brief explanation about this quiz',
              style: TextStyle(fontSize: 16),
            ),
            BottomSheetListTile(
              titleText: '${topic.questionModel!.length} Questions',
              descriptionText: '10 point for a correct answer',
              listTileIcon: Icons.event_note_outlined,
            ),
            BottomSheetListTile(
              titleText: topic.instructions!.time.toString(),
              descriptionText: 'Total duration of the quiz',
              listTileIcon: CupertinoIcons.timer,
            ),
            BottomSheetListTile(
              titleText: 'Win ${topic.instructions!.points} star',
              descriptionText: 'Answer all questions correctly',
              listTileIcon: Icons.star_outline,
            ),
            const Text(
              'Please read the text below carefully so you can understand it',
              style: TextStyle(fontSize: 16),
            ),
            BulletedList(
              bulletType: BulletType.conventional,
              style: const TextStyle(fontSize: 20),
              listOrder: ListOrder.ordered,
              bulletColor: Colors.black,
              listItems: topic.instructions!.instruction
                  .map(
                    (e) => Text(
                      e.toString(),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
