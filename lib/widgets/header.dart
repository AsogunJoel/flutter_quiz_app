import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

Widget headerWidget() {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 230,
            child: Container(
              color: const Color(0xff8981B3),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Let's Play",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "And be the first",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      const CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Ionicons.person_outline,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
            width: double.infinity,
          )
        ],
      ),
      /* STACKED WHITE CONTAINER SECTION */
      const Positioned(
        left: 20,
        right: 20,
        top: 180,
        child: Card(
          child: SizedBox(
            height: 110,
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text('Let\'s test your knowledge'),
            ),
          ),
        ),
      )
    ],
  );
}
