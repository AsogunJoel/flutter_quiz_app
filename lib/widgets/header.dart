import 'package:flutter/cupertino.dart';
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
      Positioned(
        left: 15,
        right: 15,
        top: 180,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(3, 4),
                    color: Colors.black12)
              ]),
          height: 110,
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Let\'s test your knowledge'),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        // hintStyle: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size(70, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('data'),
                  )
                ],
              )
            ],
          ),
        ),
      )
    ],
  );
}
