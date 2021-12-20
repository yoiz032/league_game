import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:league_game/domain/models/user_status_model.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class StatusController extends GetxController {
  final _records = <UserStatus>[].obs;
  final CollectionReference userStatuses =
      FirebaseFirestore.instance.collection('userStatuses');
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('userStatuses').snapshots();
  late StreamSubscription<Object?> streamSubscription;

  suscribeUpdates() async {
    logInfo('suscribeLocationUpdates');
    streamSubscription = _usersStream.listen((event) {
      logInfo('Got new item from fireStore');
      _records.clear();
      event.docs.forEach((element) {
        _records.add(UserStatus.fromSnapshot(element));
      });
      print('Got ${_records.length}');
    });
  }

  unsuscribeUpdates() {
    streamSubscription.cancel();
  }

  List<UserStatus> get entries => _records;

  addEntry(name, picUrl, email, message) {
    userStatuses
        .add({
          'name': name,
          'picUrl': picUrl,
          'email': email,
          'message': message
        })
        .then((value) => print("Status added"))
        .catchError((onError) => print("Failed to add Status $onError"));
  }

  updateEntry(UserStatus record) {
    record.reference.update({'message': record.message});
  }

  deleteEntry(UserStatus record) {
    record.reference.delete();
  }
}
