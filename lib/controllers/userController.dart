import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:e_vacina/globals.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'userController.g.dart';
// import 'package:flutter/material.dart;'

class UserController = UserControllerBase with _$UserController;

final _storage = new FlutterSecureStorage();

abstract class UserControllerBase with Store {
  @observable
  String email;

  @action
  changeEmail(String value) => email = value;

  @observable
  String password;

  @action
  changePassword(String value) => password = value;

  @observable
  dynamic userId;

  @action
  changeUserId(String value) => userId = value;

  @observable
  dynamic token;

  @action
  changeToken(String value) => token = value;

  @action
  login(String email, String password) async {
    Response response = await api.auth(email, password);

    changeToken(response.data['token']);
    changeUserId(response.data['user']['_id']);
    await _storage.write(key: 'token', value: token);
    await _storage.write(key: 'userId', value: userId);
    print('$token');
  }

  @action
  logout() async {
    changeToken('');
    changeUserId('');
    await _storage.deleteAll();
  }

  @action
  register(String email, String phoneNumber, String password) async {
    if (email.isEmpty || phoneNumber.isEmpty || password.isEmpty) {
      print("deu erro");
    }
    print("teste");
    Response response = await api.registerUser(email, phoneNumber, password);
    changeEmail(email);
    changePassword(password);
    changeUserId(response.data['savedUser']['_id']);
    login(email, password);
    print("deu certo");
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
    print(response);
    print(response.statusCode);
  }
}
