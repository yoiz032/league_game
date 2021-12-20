// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:league_game/data/repositories/firestore_database.dart';

// class ChatGroups extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('grupos')),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('grupos').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             List<DocumentSnapshot> docs=snapshot.data.documents;
//             return ListView.builder(itemCount: docs.length,
//             itemBuilder: (context, index){
//               return ListTile(
//                 title: Text(docs[index
//                 ]),
//               )
//             },);
//           }),
//     );
//   }
// }
