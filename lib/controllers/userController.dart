import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'userController.g.dart';

class UserController = UserControllerBase with _$UserController;

final _storage = new FlutterSecureStorage();

abstract class UserControllerBase with Store {
  @observable
  String email='';

  @action
  changeEmail(String value) => email = value;

  @observable
  String phoneNumber= '';

  @action
  changePhoneNumber(String value) => phoneNumber = value;

  @observable
  String password= '';

  @action
  changePassword(String value) => password = value;

  @observable
  String userId = '';

  @action
  changeUserId(String value) => userId = value;

  @observable
  dynamic token='';

  @action
  changeToken(String value) => token = value;

  @observable
  List profiles;

  @action
  changeProfiles(List value) => profiles = value;

  @observable
  bool isRegister = false;

  @action
  changeRegister(bool value) => isRegister = value;

  @action
  login(String email, String password) async {
    var resposta = true;
    try {
      Response response = await api.auth(email, password);
      changeToken(response.data['token']);
      changeUserId(response.data['user']['_id']);
      changeEmail(response.data['user']['email']);
      changePhoneNumber(response.data['user']['phoneNumber']);
      await getProfiles(userId);
      if (!isRegister)
        await profileController.changeCurrentId(profiles[0]['_id']);
      // await _storage.write(key: 'token', value: token);
      // await _storage.write(key: 'userId', value: userId);
      print('$token');
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      resposta = false;
    }
    return resposta;
  }

  @action
  logout() async {
    changeToken('');
    changeUserId('');
    // await _storage.deleteAll();
  }

  @action
  register(String email, String phoneNumber, String password, String name,
      String cpf, String sex, String birthDate) async {
    if (email.isEmpty || phoneNumber.isEmpty || password.isEmpty) {
      print("deu erro");
    }
    try {
      Response response = await api.registerUser(email, phoneNumber, password);
      changeRegister(true);
      await login(email, password);
      await profileController.createProfile(userId, name, cpf, sex, birthDate);
      print("resposta profile");
      changeEmail(email);
      changePassword(password);
      changePhoneNumber(phoneNumber);
      changeRegister(false);
    } catch (e) {
      print("deu exceção\n");
      print(e);
    }
  }

  @action
  delete() async {
    Response response = await api.deleteUser(userId, token);
    print(response);
    print(response.statusCode);
  }

  @action
  update(String email, String phoneNumber, String password) async {
    Response response =
        await api.updateUser(email, phoneNumber, password, userId, token);
    changeEmail(response.data['updtedUser']['email']);
    changePhoneNumber(response.data['updtedUser']['phoneNumber']);
    print(response);
    print(response.statusCode);
  }

  @action
  getProfiles(String userId) async {
    Response response = await api.getProfilesByUserId(userId);
    await changeProfiles(response.data['user']['profilesIds']);
    return response.data['user']['profilesIds'];
  }
}
