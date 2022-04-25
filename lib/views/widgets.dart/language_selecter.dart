import 'package:flutter/material.dart';
import 'package:language_detecter/l10n/l10n.dart';
import 'package:provider/provider.dart';

import '../../provider/language_provider.dart';

///language drop box
class LanguageDropBox extends StatefulWidget {
  const LanguageDropBox({Key? key}) : super(key: key);

  @override
  State<LanguageDropBox> createState() => _LanguageDropBoxState();
}

class _LanguageDropBoxState extends State<LanguageDropBox> {
  @override
  Widget build(BuildContext context) {
    ///set locale to current langauge chosen
    final provider = Provider.of<LocaleProvider>(context, listen: true);
    final locale = provider.locale ?? const Locale('en');
    return Scaffold(
      body: DropdownButton<dynamic>(

          ///add languages choice to dropdown
          elevation: 2,
          value: locale,
          style: const TextStyle(
            color: Color(0xff2A8AA9),
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          isExpanded: true,
          items: L10n.all.map((locale) {
            final languageChosen = L10n.getLanguage(locale.languageCode);
            return buildMenuItem(locale, languageChosen);
          }).toList(),
          onChanged: (_) {}),
    );
  }

  ///drop down menu item
  DropdownMenuItem buildMenuItem(Locale locale, String languageChosen) =>
      DropdownMenuItem(
        value: locale,
        child: Text(
          languageChosen,
        ),
        onTap: () {
          {
            final provider =
                Provider.of<LocaleProvider>(context, listen: false);
            provider.setLocale(locale);
          }
        },
      );
}
