// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:league_game/domain/models/group.dart';
// import 'package:league_game/ui/pages/chat/message.dart';

// Stream<List<Group>> getGroups() {
//   FirebaseFirestore.instance.collection('groups').snapshots().map(toGroupList);
// }

// Stream<list<Message>> getGrouoMeseges(Str groupId) {
//   return FirebaseFirestore.instance
//       .collection('groups/$groupId/messages')
//       .snapshots()
//       .map(toMessageList);
// }
