import 'package:test/test.dart';
import 'package:e_vacina/controllers/profileController.dart';
void main() {

  group('ProfileController', () {
    test('currentId should start with null ', () {
      ProfileController profileController = new ProfileController();

      expect(profileController.currentId, null);
    });

    test('currentCpf should start with null ', () {
      ProfileController profileController = new ProfileController();

      expect(profileController.currentCpf, null);
    });

    test('currentName should start with null ', () {
      ProfileController profileController = new ProfileController();

      expect(profileController.currentName, null);
    });

    test('currentSex should start with null ', () {
      ProfileController profileController = new ProfileController();

      expect(profileController.currentSex, null);
    });

    test('currentBirthDate should start with null ', () {
      ProfileController profileController = new ProfileController();

      expect(profileController.currentBirthDate, null);
    });

    test('names should start with null ', () {
      ProfileController profileController = new ProfileController();

      expect(profileController.names, null);
    });


  });
}
