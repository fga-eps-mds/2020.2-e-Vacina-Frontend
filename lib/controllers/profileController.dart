import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'profileController.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

//final _storage = new FlutterSecureStorage();

abstract class ProfileControllerBase with Store {
  @observable
  dynamic currentId;

  @action
  changeCurrentId(String value) => currentId = value;

  @observable
  String currentCpf;

  @action
  changeCurrentCpf(String value) => currentCpf = value;

  @observable
  String currentName;

  @action
  changeCurrentName(String value) => currentName = value;

  @observable
  String currentSex;

  @action
  changeCurrentSex(String value) => currentSex = value;

  @observable
  String currentBirthDate;

  @action
  changeCurrentBirthDate(String value) => currentBirthDate = value;

  @observable
  List names;

  @action
  changeCurrentNames(List value) => names = value;

  @action
  createProfile(String userId, String name, String cpf, String sex,
      String birthDate) async {
    bool profile = true;
    try {
      Response response =
          await api.createProfile(userId, name, cpf, sex, birthDate);
      changeCurrentId(response.data['newProfile']['_id']);
      changeCurrentName(response.data['newProfile']['name']);
      changeCurrentCpf(response.data['newProfile']['cpf']);
      changeCurrentBirthDate(response.data['newProfile']['birthDate']);
      changeCurrentSex(response.data['newProfile']['sex']);
      print(response);
    } catch (err) {
      print("deu exceção crateProfile\n");
      print(err);
      profile = false;
    }
    return profile;
  }

  @action
  delete(String profileId) async {
    bool resposta = true;
    try {
      Response response = await api.deleteProfile(profileId);
      print(response);
      print(response.statusCode);
    } catch (err) {
      print("deu exceção\n");
      resposta = false;
    }
    return resposta;
  }

  @action
  update(String name, String cpf, String sex, String birthDate) async {
    bool profile = true;
    try {
      Response response =
          await api.updateProfile(currentId, name, cpf, sex, birthDate);
      print(response);
      print(response.statusCode);
    } catch (err) {
      print("deu exceção\n");
      print(err);
      profile = false;
    }
    return profile;
  }

  @action
  getById(String profileId) async {
    try {
      Response response = await api.getProfile(profileId);
      changeCurrentId(response.data['profile']['_id']);
      changeCurrentName(response.data['profile']['name']);
      changeCurrentCpf(response.data['profile']['cpf']);
      changeCurrentBirthDate(response.data['profile']['birthDate']);
      changeCurrentSex(response.data['profile']['sex']);
    } catch (err) {
      print(err);
    }
  }
}
