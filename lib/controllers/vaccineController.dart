import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'vaccineController.g.dart';

class VaccineController = VaccineControllerBase with _$VaccineController;

// final _storage = new FlutterSecureStorage();

abstract class VaccineControllerBase with Store {
  @observable
  dynamic preventDeseases;

  @action
  changePreventeDeseases(dynamic value) => preventDeseases = value;

  @observable
  dynamic recommendations;

  @action
  changeRecommendations(dynamic value) => recommendations = value;

  @observable
  dynamic vaccineId;

  @action
  changeVaccineId(dynamic value) => vaccineId = value;

  @observable
  dynamic vaccineName;

  @action
  changeVaccineName(dynamic value) => vaccineName = value;

  @observable
  dynamic description;

  @action
  changeDescription(dynamic value) => description = value;

  @observable
  dynamic numberOfDoses;

  @action
  changeNumberOfDoses(dynamic value) => numberOfDoses = value;

  @observable
  dynamic periodicity;

  @action
  changePeriodicity(dynamic value) => periodicity = value;

  @observable
  List takenVaccines;

  @action
  changeTakenVaccine(List value) => takenVaccines = value;

  @action
  getTakenVaccine() async {
    Response response = await api.getTakenVaccines();
    await changeTakenVaccine(response.data["takenVaccine"]);
    return response.data["takenVaccine"];
  }

  @action
  postTakenVaccine() async {
    var resposta = true;
    try {
      await api.postTakenVaccine(
          profileController.currentId, vaccineController.vaccineId);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      resposta = false;
    }
    return resposta;
  }

  @action
  getVaccines() async {
    Response response = await api.getVaccines();
    return response.data["vaccines"];
  }

  chosenVaccine(String vacineId) async {
    Response response = await api.getVaccineById(vacineId);
    changePreventeDeseases(response.data['vaccine']['preventDeseases']);
    changeRecommendations(response.data['vaccine']['recommendations']);
    changeVaccineId(response.data['vaccine']['_id']);
    changeVaccineName(response.data['vaccine']['name']);
    changeDescription(response.data['vaccine']['description']);
    changeNumberOfDoses(response.data['vaccine']['numberOfDoses']);
    changePeriodicity(response.data['vaccine']['periodicity']);
  }
}
