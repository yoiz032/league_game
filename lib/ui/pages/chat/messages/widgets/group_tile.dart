// import 'package:flutter/material.dart';
// import 'package:league_game/domain/models/group.dart';

// class GrupTile extends StatelessWidget {
//   final Group group;
//   const GrupTile(this.group);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.of(context).pushNamed('/chat', arguments: group);
//       },
//       leading: Container(
//         width: 40,
//         decoration:
//             BoxDecoration(color: Colors.red[200], shape: BoxShape.circle),
//       ),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Text(group.name),
//           Text(
//             '2021',
//             style: TextStyle(
//               color: Colors.black26,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//       subtitle: Text(group.id),
//     );
//   }
// }
