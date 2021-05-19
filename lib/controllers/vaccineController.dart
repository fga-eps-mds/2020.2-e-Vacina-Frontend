import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'vaccineController.g.dart';

class VaccineController = VaccineControllerBase with _$VaccineController;

// final _storage = new FlutterSecureStorage();

abstract class VaccineControllerBase with Store {
  @observable
  List takenVaccines;

  @action 
  changeTakenVaccine(List value) => takenVaccines = value;

  @observable
  List dateOfTakenVaccines;

  @action
  changedateOfTakenVaccines(List value) => dateOfTakenVaccines = value;

  @action
  getVaccines() async {
    Response response = await api.getVaccines();
    return response.data["vaccines"];
  }

  @action
  getTakenVaccine() async {
    Response response = await api.getTakenVaccines();
    await changeTakenVaccine(response.data["takenVaccine"]);
    return response.data["takenVaccine"];
  }

  @action
  postTakenVaccine(String vaccineId) async {
    var resposta = true;
    try {
      await api.postTakenVaccine(profileController.currentId, vaccineId);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      resposta = false;
    }
    return resposta;
  }

  updateTakenVaccine(String takenVaccineId, List date) async {
    try {
      await api.updateTakenVaccine(takenVaccineId, date);
    } on DioError catch (err) {
      print('erro');
      print("Erro: ${err.response.statusCode}");
    }
  }

  getDateofTakenVaccine(String takenVaccineId) async {
    try {
      Response response = await api.getTakenVaccineById(takenVaccineId);
      print(response.data["takenVaccine"]["dateOfDosesTaken"]);
      changedateOfTakenVaccines(
          response.data["takenVaccine"]["dateOfDosesTaken"]);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
    }
  }

  deleteTakenVaccine(String takenVaccineId) async {
    try {
      await api.deleteTakenVaccineById(takenVaccineId);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
    }
  }
}
