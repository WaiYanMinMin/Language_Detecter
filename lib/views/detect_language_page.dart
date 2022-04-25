import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_detecter/views/widgets.dart/detect_button.dart';
import 'package:language_detecter/views/widgets.dart/show_result.dart';
import 'package:language_detecter/views/widgets.dart/textfield.dart';

import '../model/language_api.dart';
import 'hamburger.dart';

Set languageSet = <String>{};

class DetectLanguagePage extends StatefulWidget {
  const DetectLanguagePage({Key? key}) : super(key: key);

  @override
  State<DetectLanguagePage> createState() => _DetectLanguagePageState();
}

class _DetectLanguagePageState extends State<DetectLanguagePage> {
  TextEditingController input = TextEditingController();

  ///controller for textfield
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ///key for drawer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,

        ///key for drawer
        drawer: const HanburgerMenuPage(),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff7FC0D6), Color(0xff2A89A8)])),
            child: Stack(
              children: [
                Positioned(
                  ///Drawer Button
                  left: 10,
                  top: 20,
                  child: FloatButton(
                    buttonName: 'Drawer',
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();

                      ///open drawer ontap
                    },
                    iconData: Icons.menu_outlined,
                  ),
                ),
                Positioned(
                  ///text field and detect button widget
                  left: MediaQuery.of(context).size.width * 0.2,
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///text field widget
                      BuildTextField(
                          hinttext: AppLocalizations.of(context)?.typesmth ??
                              "Type something",
                          type: TextInputType.name,
                          controller: input,
                          line: 1),
                      GestureDetector(
                        ///Detect button
                        onTap: () async {
                          languageSet = await translate(input.text);
                          showresult(context);

                          ///on pressed, translate the text and show result
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              color: const Color(0xff2B8AA9)),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(top: 20),
                          width: 100,
                          height: 40,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)?.check ?? "Detect",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}





