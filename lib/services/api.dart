import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:e_vacina/globals.dart';

part 'api.g.dart';
// import 'package:flutter/material.dart;'

class Api = ApiBase with _$Api;

abstract class ApiBase with Store {
  @action
  getUser() async {}

  @action
  testConnection() async {
    Response response = await dio.get('/');
    print(response);
  }

  @action
  auth(String email, String password) async {
    Response response = await dio
        .post('/auth/login/', data: {'email': email, 'password': password});
    return response;
  }

  @action
  registerUser(String email, String phoneNumber, String password) async {
    Response response = await dio.post('/user', data: {
      'email': '$email',
      'phoneNumber': '$phoneNumber',
      'password': '$password'
    });
    return response;
  }

  @action
  deleteUser(String userId, String token) async {
    Response response = await dio.delete(
      '/user/$userId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  updateUser(String email, String phoneNumber, String password, String userId,
      String token) async {
    Response response = await dio.put('/user/$userId',
        data: {
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response;
  }

  @action
  createProfile(String userId, String name, String cpf, String sex,
      String birthDate) async {
    var token = userController.token;
    print("dentro apiprofile");
    print(userId);
    print("cabou create-------------------");
    Response response = await dio.post('/profile/$userId',
        data: {'name': name, 'cpf': cpf, 'birthDate': birthDate, 'sex': sex},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response;
  }

  @action
  updateProfile(String profileId, String name, String cpf, String sex,
      String birthDate) async {
    var token = userController.token;
    Response response = await dio.put('/profile/$profileId',
        data: {
          'name': name,
          'cpf': cpf,
          'birthDate': birthDate,
          'sex': sex,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response;
  }

  @action
  deleteProfile(String profileId) async {
    var token = userController.token;
    var userId = userController.userId;
    Response response = await dio.delete('/profile/$profileId/user/$userId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response;
  }

  @action
  getProfile(String profileId) async {
    var token = userController.token;
    Response response = await dio.get('/profile/$profileId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response;
  }

  getProfilesByUserId(String userId) async {
    var token = userController.token;
    Response response = await dio.get('/user/$userId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response;
  }
}
