/* Drawer menu builder */
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData iconName;
  final String text;
  final Function navigateTo;

  const MenuItem(
      {Key? key,
      required this.iconName,
      required this.text,
      required this.navigateTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(),
      child: ListTile(
        ///icon and text
        leading: Icon(
          iconName,
          color: const Color(0xff2A8AA9),
          size: 24,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xff6A6A6A),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
