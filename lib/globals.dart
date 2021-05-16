import 'package:dio/dio.dart';
import 'package:e_vacina/controllers/userController.dart';
import 'package:e_vacina/controllers/vaccineController.dart';
import 'package:e_vacina/controllers/profileController.dart';
import 'package:e_vacina/services/api.dart';

UserController userController = new UserController();
ProfileController profileController = new ProfileController();
VaccineController vaccineController = new VaccineController();

Api api = new Api();

var options = BaseOptions(
  baseUrl: 'http://localhost:3000',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

var dio = Dio(options);
