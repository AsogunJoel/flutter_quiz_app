import 'package:flutter/material.dart';

import '../models/topic_model.dart';

class BuildHorizontalSlide extends StatefulWidget {
  const BuildHorizontalSlide({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildHorizontalSlide> createState() => _BuildHorizontalSlideState();
}

class _BuildHorizontalSlideState extends State<BuildHorizontalSlide> {
  // void Function
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.all(5),
                  height: 25,
                  width: 85,
                  child: Center(
                    child: Text(
                      subjects[index].subTopic[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: currentIndex == index,
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff8981B3),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
