import 'dart:developer';

import 'package:language_detecter/database/firebase.dart';
import 'package:translator/translator.dart';

Future<Set<String>> translate(String input) async {
  final translator = GoogleTranslator();
  var languageSet = <String>{};
  log("input text receieved: " + input);
  for (var rune in input.runes) {
    var inputCharacter = String.fromCharCode(rune);

    if (inputCharacter != " ") {
      try {
        var detectlang = await translator.translate(inputCharacter, to: 'ru');
        languageSet.add(detectlang.sourceLanguage.toString());
      } catch (e) {
        log("catching burmese special character.");
      }
    }
  }
  addDataToFirestore(input, languageSet);
  if (languageSet.contains("Automatic")) {
    languageSet.remove("Automatic");
  }

  return languageSet;
}
