import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveQuizCardWidget extends StatelessWidget {
  const LiveQuizCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        isThreeLine: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        leading: Container(
          height: 60,
          width: 60,
          color: const Color(0xffE3FEF0),
          child: const Icon(
            CupertinoIcons.grid,
            size: 35,
            color: Color(0xff49D68C),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Computer',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.star_outlined,
                    color: Color(0xffFFBD6C),
                    size: 27,
                  ),
                  Text(
                    '4.8',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
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
                    Icon(CupertinoIcons.square_pencil),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '10/10 Questions',
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Icon(CupertinoIcons.time),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '1 hour 15 mins',
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),

            //  RATING SECTION
          ],
        ),
      ),
    );
  }
}
