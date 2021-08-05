import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getx/api/database.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> courseDocStream = FirebaseFirestore.instance
        .collection('notes')
        .doc('hDCX9ZWSJKZ0f80NdQg7lhyPBsG3')
        .snapshots();
    print(Database.readItems());
    return StreamBuilder<DocumentSnapshot>(
      stream: courseDocStream,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            print('hihihihihihihihihi');
          }
          FirebaseFirestore.instance
              .collection('notes')
              .doc('hDCX9ZWSJKZ0f80NdQg7lhyPBsG3')
              .get()
              .then(
                  (querySnapshot) => querySnapshot.get('items').forEach((doc) {
                        print('1212 $doc["title"]');
                        return Container();
                      }));
          return Container();
          // return ListView.builder(
          //   itemCount: snapshot.data!['section'].data().length,
          //   itemBuilder: (ctx, index) =>
          //       Text(snapshot.data!['section'].data()[index]['title']),
          // );
        } else {
          return Container();
        }
      },
    );
  }
}
