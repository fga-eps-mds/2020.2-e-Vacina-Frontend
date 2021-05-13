import 'package:test/test.dart';
import 'package:e_vacina/controllers/vaccineController.dart';
void main() {

  group('VaccineController', () {
    test('preventDeseases should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.preventDeseases, null);
    });

    test('recommendations should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.recommendations, null);
    });

    test('vaccineId should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.vaccineId, null);
    });

    test('vaccineName should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.vaccineName, null);
    });

    test('description should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.description, null);
    });

    test('numberOfDoses should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.numberOfDoses, null);
    });

    test('periodicity should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.periodicity, null);
    });

    test('takenVaccines should start with null ', () {
      VaccineController vaccineController = new VaccineController();


      expect(vaccineController.takenVaccines, null);
    });
  });
}
