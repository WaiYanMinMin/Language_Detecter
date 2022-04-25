/* Drawer,create new account,or get existing accounts.
Navigate to other pages */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_detecter/views/widgets.dart/drawer_header.dart';
import 'package:language_detecter/views/widgets.dart/drawer_item.dart';
import 'package:language_detecter/views/widgets.dart/language_selecter.dart';

import 'history.dart';

class HanburgerMenuPage extends StatefulWidget {
  const HanburgerMenuPage({Key? key}) : super(key: key);

  @override
  State<HanburgerMenuPage> createState() => _HanburgerMenuPageState();
}

class _HanburgerMenuPageState extends State<HanburgerMenuPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Material(
          color: Colors.white,
          child: ListView(
            children: const [
              DrawerHeaderWidget(),

              ///title

              DrawerBody(),

              ///body
            ],
          ),
        ),
      ),
    );
  }
}

/* drawer body widget */
class DrawerBody extends StatelessWidget {
  const DrawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: const MenuItemsContainer(),

            ///menu items
          ),
        ],
      ),
    );
  }
}

/* Drawer menu items */
class MenuItemsContainer extends StatefulWidget {
  const MenuItemsContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuItemsContainer> createState() => _MenuItemsContainerState();
}

class _MenuItemsContainerState extends State<MenuItemsContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          ///history navigation
          iconName: Icons.history,
          text: AppLocalizations.of(context)?.history ?? "History",
          navigateTo: () {
            Get.to(() => const HistoryPage());
          },
        ),
        ListTile(
          ///language selecter
          leading:
              const Icon(Icons.language_outlined, color: Color(0xff2A8AA9)),
          trailing: const SizedBox(
            width: 80,
            child: LanguageDropBox(),

            ///choose language
          ),
          title: Text(
            AppLocalizations.of(context)?.language ?? "Lagangue",
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
