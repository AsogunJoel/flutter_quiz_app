import 'package:flutter/material.dart';

import '../widgets/bottom_sheet_widget.dart';

class QuestionDescriptionPage extends StatelessWidget {
  const QuestionDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8981B3),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Text(
                            "Quiz Detail",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'UI/UX Design Quiz',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Row(
                              children: const [
                                Text(
                                  '1.5', //.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                Icon(
                                  Icons.star_outlined,
                                  color: Color(0xffFFBD6C),
                                  // size: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Text(
                          'Get 100 Points',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              flex: 4,
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  /* BOTTOM SHEET CONTENT SECTION   */
                  child: const BottomSheetCustomWidget()),
            )
          ],
        ),
      ),
    );
  }
}
