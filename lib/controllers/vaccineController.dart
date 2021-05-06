import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'vaccineController.g.dart';

class VaccineController = VaccineControllerBase with _$VaccineController;

final _storage = new FlutterSecureStorage();

abstract class VaccineControllerBase with Store {
  @observable
  List takenVaccines = [];

  @action
  changeTakenVaccine(List value) => takenVaccines = value;

  @action
  getTakenVaccine() async {
    Response response = await api.getTakenVaccines();
    print(response.data["takenVaccine"]);
    await changeTakenVaccine(response.data["takenVaccine"]);
    return response.data["takenVaccine"];
  }
}
