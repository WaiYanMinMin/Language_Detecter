import 'package:flutter/material.dart';
import 'package:language_detecter/model/language_api.dart';
import 'package:language_detecter/views/widgets.dart/show_result.dart';

///Text Field customized widget
// ignore: must_be_immutable
class BuildTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String hinttext;
  TextInputType type;
  int line;
  Set languageSet = <String>{};
  BuildTextField(
      {Key? key,
      required this.hinttext,
      required this.type,
      required this.controller,
      required this.line})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: Colors.white),
      child: TextField(
        onSubmitted: (value) async {
          ///translate text and show result when pressed Enter on keyboard.
          languageSet = await translate(value);
          showresult(context);
        },
        controller: controller,
        cursorHeight: 5,
        cursorColor: const Color(0xff2B8AA9),
        cursorWidth: 3,
        keyboardType: type,
        textInputAction: TextInputAction.done,
        maxLines: line,
        style: const TextStyle(
          color: Color(0xff2B8AA9),
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xff2B8AA9),
          ),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
