import 'package:flutter_test/flutter_test.dart';
import 'package:league_game/data/repositories/password_auth.dart';
import 'package:league_game/domain/use_cases/auth_management.dart';

void main() {
  // AuthManagement uses Auth for management
  // Contrast method result with expected value
  late AuthManagement management;

  setUp(() {
    management = AuthManagement(
      auth: PasswordAuth(),
    );
  });
  test(
    "SignIn valid",
    () async {
      expect(
          await management.signIn(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!"),
          true);
    },
  );

  test(
    "SignIn invalid",
    () async {
      expect(
          await management.signIn(email: "user@test.com", password: "123456"),
          false);
    },
  );

  test(
    "SignUp valid",
    () async {
      expect(
          await management.signUp(
              name: "User",
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!"),
          true);
    },
  );

  test(
    "SignUp invalid",
    () async {
      expect(
          await management.signUp(
            name: "User",
            email: "usertest.xys",
            password: "1456",
          ),
          false);
    },
  );

  test(
    "SignOut validation",
    () async {
      expect(await management.signOut(), true);
    },
  );
}
