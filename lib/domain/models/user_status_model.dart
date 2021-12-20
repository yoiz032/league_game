import 'package:cloud_firestore/cloud_firestore.dart';

class UserStatus {
  final String picUrl, name, email, message;
  final DocumentReference reference;

  UserStatus.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['name'] != null),
        assert(map['picUrl'] != null),
        assert(map['email'] != null),
        assert(map['message'] != null),
        name = map['name'],
        picUrl = map['picUrl'],
        email = map['email'],
        message = map['message'];

  UserStatus.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$message>";
}
