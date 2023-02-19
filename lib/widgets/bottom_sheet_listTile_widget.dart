import 'package:flutter/material.dart';

class BottomSheetListTile extends StatelessWidget {
  final String titleText;
  final String descriptionText;
  final IconData listTileIcon;

  const BottomSheetListTile({
    super.key,
    required this.titleText,
    required this.descriptionText,
    required this.listTileIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 20,
        backgroundColor: Colors.black,
        child: Icon(listTileIcon),
      ),
      title: Text(
        titleText,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        descriptionText,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
