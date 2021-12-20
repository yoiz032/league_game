import 'package:firebase_auth/firebase_auth.dart';
import 'package:league_game/domain/models/user_status_model.dart';
import 'package:league_game/domain/controller/status_controller.dart';
import 'package:league_game/domain/use_cases/controllers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

class UserStatusPage extends StatefulWidget {
  const UserStatusPage({Key? key}) : super(key: key);

  @override
  State<UserStatusPage> createState() => _FireStorePageState();
}

class _FireStorePageState extends State<UserStatusPage> {
  late AuthController authController;
  final StatusController statusController = Get.put(StatusController());

  @override
  void initState() {
    statusController.suscribeUpdates();
    authController = Get.find<AuthController>();
    super.initState();
  }

  @override
  void dispose() {
    statusController.unsuscribeUpdates();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => ListView.builder(
              itemCount: statusController.entries.length,
              padding: const EdgeInsets.only(top: 15.0),
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(context, statusController.entries[index]);
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addStatus(context);
          },
        ));
  }

  Widget _buildItem(BuildContext context, UserStatus record) {
    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          subtitle: Text(record.message.toString()),
          onLongPress: () => statusController.deleteEntry(record),
          onTap: () => statusController.updateEntry(record),
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,

            child: Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: const CircleAvatar(),
            ),
            // leading: const FlutterLogo(),
            // subtitle: Text(record.message.toString()),
            // onTap: () => statusController.updateEntry(record),
            // onLongPress: () => statusController.deleteEntry(record),
          ),
        ),
      ),
    );
  }

  Future<void> addStatus(BuildContext context) async {
    User user = authController.currentUser!;
    final picUrl = user.photoURL ??
        "https://ui-avatars.com/api/?name=${user.displayName ?? 'User'}";
    final name = user.displayName;
    final email = user.email;
    getName(context).then((value) {
      statusController.addEntry(name, picUrl, email, value);
    });
  }

  Future<String> getName(BuildContext context) async {
    String? result = await prompt(
      context,
      title: const Text('Adding a message'),
      initialValue: '',
      textOK: const Text('Ok'),
      textCancel: const Text('Cancel'),
      hintText: 'Your Message',
      minLines: 1,
      autoFocus: true,
      obscureText: false,
      textCapitalization: TextCapitalization.words,
    );
    if (result != null) {
      return Future.value(result);
    }
    return Future.error('cancel');
  }
}
