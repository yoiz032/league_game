// import 'package:flutter/material.dart';
// import 'package:league_game/db.dart' as db;
// import 'package:league_game/domain/models/group.dart';

// import 'messages/widgets/group_tile.dart';

// class ChatGroups extends StatelessWidget {
//   const ChatGroups({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('grupos')),
//       body: StreamBuilder(
//           stream: db.getGroups(),
//           builder: (context, AsyncSnapshot<List<Group>> snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error.toString(),
//                     style: TextStyle(
//                       backgroundColor: Colors.red,
//                     )),
//               );
//             }
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             List<Group>? groups = snapshot.data;
//             return ListView.separated(
//               itemCount: groups!.length,
//               itemBuilder: (context, index) {
//                 final Group group = groups[index];
//                 return GrupTile(group);
//               },
//               separatorBuilder: (context, index) {
//                 return Divider(
//                   height: 1.0,
//                   indent: 75.0,
//                   endIndent: 15.0,
//                 );
//               },
//             );
//           }),
//     );
//   }
// }
