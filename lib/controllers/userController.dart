import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:e_vacina/globals.dart';

part 'userController.g.dart';
// import 'package:flutter/material.dart;'

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  @observable
  String email;

  @action
  changeEmail(String value) => email = value;

  @observable
  String password;

  @action
  changePassword(String value) => password = value;

  @action
  teste() async {
    Response response = await dio.get('/');
    print(response);
  }

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
    Response response = await dio
        .post('/auth/login/', data: {'email': email, 'password': password});

    changeToken(response.data['token']);
    changeUserId(response.data['user']['_id']);
    print('$token');
  }

  @action
  register(String email, String phoneNumber, String password) async {
    if (email.isEmpty || phoneNumber.isEmpty || password.isEmpty) {
      print("deu erro");
    }
    print("teste");
    Response response = await dio.post('/user', data: {
      'email': '$email',
      'phoneNumber': '$phoneNumber',
      'password': '$password'
    });
    changeEmail(email);
    changePassword(password);
    changeUserId(response.data['savedUser']['_id']);
    login(email, password);
    print("deu certo");
  }

  @action
  delete() async {
    Response response = await dio.delete(
      '/user/$userId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    print(response);
    print(response.statusCode);
  }

  @action
  update(String email, String phoneNumber, String password) async {
    Response response = await dio.put('/user/$userId',
        data: {
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    print(response);
    print(response.statusCode);
  }
}
