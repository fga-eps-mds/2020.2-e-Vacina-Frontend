import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'userController.g.dart';

class UserController = UserControllerBase with _$UserController;

final _storage = new FlutterSecureStorage();

abstract class UserControllerBase with Store {
  @observable
  String email;

  @action
  changeEmail(String value) => email = value;

  @observable
  String phoneNumber;

  @action
  changePhoneNumber(String value) => phoneNumber = value;

  @observable
  String password;

  @action
  changePassword(String value) => password = value;

  @observable
  String userId = '';

  @action
  changeUserId(String value) => userId = value;

  @observable
  dynamic token;

  @action
  changeToken(String value) => token = value;

  @action
  login(String email, String password) async {
    try {
      Response response = await api.auth(email, password);
      print(response.data.toString());
      changeToken(response.data['token']);
      changeUserId(response.data['user']['_id']);
      changeEmail(response.data['user']['email']);
      changePhoneNumber(response.data['user']['phoneNumber']);
      await profileController.changeCurrentId('6091b6e1ef0b20001ffa8673');
    } catch (error) {
      print(error.error);
      print(error['error']);
    }
    // await _storage.write(key: 'token', value: token);
    // await _storage.write(key: 'userId', value: userId);
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
      await login(email, password);
      Response rProfile = await profileController.createProfile(
          userId, name, cpf, sex, birthDate);
      print("resposta profile");
      changeEmail(email);
      changePassword(password);
      changePhoneNumber(phoneNumber);
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
}
