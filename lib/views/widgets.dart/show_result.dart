
import 'package:flutter/material.dart';
import 'package:language_detecter/views/detect_language_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
///customized widget to show the result
void showresult(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      
      ///if the detected language is not empty, show result.
      ///else, show error message
      content: (languageSet.isNotEmpty)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(AppLocalizations.of(context)?.languages ?? "Languages:"),
                for (int _i = 0; _i < languageSet.length; _i++)
                  (_i == languageSet.length - 1)
                      ? Flexible(
                          child: Text(
                            languageSet.elementAt(_i),
                            softWrap: true,
                          ),
                        )
                      : Flexible(
                          child: Text(
                            languageSet.elementAt(_i) + ",",
                            softWrap: true,
                          ),
                        ),
              ],
            )
          : const Text("Invalid input."),
    ),
  );
}
