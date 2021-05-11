import 'package:test/test.dart';
import 'package:e_vacina/controllers/userController.dart';

void main() {

  group('UserController', () {
    test('email should start with "" ', () {
      UserController userController = new UserController();

      expect(userController.email, "");
    });

    test('phoneNumber should start with "" ', () {
      UserController userController = new UserController();

      expect(userController.phoneNumber, "");
    });

    test('password should start with "" ', () {
      UserController userController = new UserController();

      expect(userController.password, "");
    });

    test('userId should start with ""', () {
      UserController userController = new UserController();

      expect(userController.userId, "");
    });

    test('token should start with ""', () {
      UserController userController = new UserController();

      expect(userController.token, "");
    });

    test('profiles should start with null', () {
      UserController userController = new UserController();

      expect(userController.profiles,null);
    });

    test('register should start with false', () {
      UserController userController = new UserController();

      expect(userController.isRegister, false);
    });
  });
}
