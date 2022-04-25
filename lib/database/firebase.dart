import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

///method for adding data
void addDataToFirestore(String input, Set<String> result) {
  _firestore
      .collection('history')
      .add({'input': input, 'result': result.toString()});
}

///method for retreving data
Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
  return _firestore.collection('history').snapshots();
}
