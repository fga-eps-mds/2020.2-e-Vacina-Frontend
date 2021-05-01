import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'profileController.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

final _storage = new FlutterSecureStorage();

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

  @action
  createProfile(String userId, String name, String cpf, String sex,
      String birthDate) async {
    Response response =
        await api.createProfile(userId, name, cpf, sex, birthDate);
    changeCurrentId(response.data['newProfile']['_id']);
    return response;
  }

  @action
  delete(String profileId) async {
    Response response = await api.deleteProfile(profileId);
    print(response);
    print(response.statusCode);
  }

  @action
  update(String name, String cpf, String sex, String birthDate) async {
    Response response =
        await api.updateProfile(currentId, name, cpf, sex, birthDate);
    print(response);
    print(response.statusCode);
  }
}
