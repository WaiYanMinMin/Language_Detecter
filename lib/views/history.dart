import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_detecter/database/firebase.dart';
import 'package:language_detecter/views/widgets.dart/back_button.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const ButtonBack(),
          title: Text(
            AppLocalizations.of(context)?.history ?? "History",
            style: const TextStyle(color: Color(0xff2A8AA9)),
          ),
        ),
        body: StreamBuilder(
          stream: getData(),

          ///input stream
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              ///if snapshot has no data,show progress indicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              ///if there is data received,show the data as list
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data?.docs[index]['input']),
                        subtitle: Text(snapshot.data?.docs[index]['result']),
                      ));
            }
          },
        ));
  }
}
