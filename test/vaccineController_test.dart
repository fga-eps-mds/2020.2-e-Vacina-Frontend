import 'package:test/test.dart';
import 'package:e_vacina/controllers/vaccineController.dart';

void main() {
  group('VaccineController', () {
    test('takenVaccines should start with null ', () {
      VaccineController vaccineController = new VaccineController();

      expect(vaccineController.takenVaccines, null);
    });
  });
}
