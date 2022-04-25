import 'package:flutter/material.dart';

////customized widget for button
class FloatButton extends StatelessWidget {
  final String buttonName;
  final IconData iconData;
  final VoidCallback onTap;

  const FloatButton(
      {Key? key,
      required this.buttonName,
      required this.onTap,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: IconButton(
        splashRadius: 50,
        tooltip: buttonName,
        onPressed: onTap,
        icon: Icon(
          iconData,
          size: 24,
          color: const Color(0xff2A8AA9),
        ),
      ),
    );
  }
}
