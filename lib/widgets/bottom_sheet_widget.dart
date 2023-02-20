import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_listTile_widget.dart';

class BottomSheetCustomWidget extends StatelessWidget {
  const BottomSheetCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            const Text(
              'Brief explanation about this quiz',
              style: TextStyle(fontSize: 16),
            ),
            const BottomSheetListTile(
              titleText: '10 Question',
              descriptionText: '10 point for a correct answer',
              listTileIcon: Icons.event_note_outlined,
            ),
            const BottomSheetListTile(
              titleText: '1 hour 15 min',
              descriptionText: 'Total duration of the quiz',
              listTileIcon: CupertinoIcons.timer,
            ),
            const BottomSheetListTile(
              titleText: 'Win 10 star',
              descriptionText: 'Answer all questions correctly',
              listTileIcon: Icons.star_outline,
            ),

            //
            const Text(
              'Please read the text below carefully so you can understand it',
              style: TextStyle(fontSize: 16),
            ),

            //
            const BulletedList(
              bulletType: BulletType.conventional,
              style: TextStyle(fontSize: 20),
              listOrder: ListOrder.ordered,
              // bullet: Icon(Icons.start),
              bulletColor: Colors.black,
              listItems: [
                Text(
                    '10 point awarded for a correct answer and No mark for a incorrect answer'),
                Text('Tap on options to select the correct answer'),
                Text('Tap on the bookmark icon to save interesting questions'),
                Text(
                    'Click submit if you are sure you want to complete all the quizzes'),
              ],
            ),

            //
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8981B3),
              ),
              child: const Center(
                child: Text('Start Quiz'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
