import 'package:flutter_test/flutter_test.dart';
import 'package:league_game/data/repositories/password_auth.dart';

void main() {
  late PasswordAuth auth;

  setUp(() {
    auth = PasswordAuth();
  });

  test('auth-signin', () async {
    final result = await auth.signIn(
        email: "barry.allen@example.com", password: "SuperSecretPassword!");
    expect(result, true);
  });

  test('auth-signup', () async {
    final result = await auth.signUp(
        name: "Barry Allen",
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!");
    expect(result, true);
  });

  test('auth-signout', () async {
    final result = await auth.signOut();
    expect(result, true);
  });
}
