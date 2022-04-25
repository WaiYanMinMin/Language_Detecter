import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:language_detecter/provider/language_provider.dart';
import 'package:language_detecter/views/detect_language_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/l10n.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    ///init firebase for web
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyCxG6J-1nkK6brQLC3UqQhdzk5fa1_V24A",
      authDomain: "languagedetecter.firebaseapp.com",
      projectId: "languagedetecter",
      storageBucket: "languagedetecter.appspot.com",
      messagingSenderId: "120783160514",
      appId: "1:120783160514:web:b37990d653932f211ea75b",
      measurementId: "G-J4CJ88QW82",
    ));
  } else {
    ///initialization firebase for other platforms
    await Firebase.initializeApp();
  }

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleProvider(),

        ///initialization provider for localization
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all, //English-Burmese
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            ///initialization localization
            locale: provider.locale,

            ///get locale value from provider
            title: 'Language Detecter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const DetectLanguagePage(),

            ///go to the main page
          );
        });
  }
}
