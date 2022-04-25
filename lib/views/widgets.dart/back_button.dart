import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ButtonBack extends StatefulWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  _ButtonBackState createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: IconButton(
        tooltip: "Back Button",
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          size: 24,
          color: Color(0xff2A8AA9),
        ),
      ),
    );
  }
}
