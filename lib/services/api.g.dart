// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Api on ApiBase, Store {
  final _$getUserAsyncAction = AsyncAction('ApiBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$testConnectionAsyncAction = AsyncAction('ApiBase.testConnection');

  @override
  Future testConnection() {
    return _$testConnectionAsyncAction.run(() => super.testConnection());
  }

  final _$authAsyncAction = AsyncAction('ApiBase.auth');

  @override
  Future auth(String email, String password) {
    return _$authAsyncAction.run(() => super.auth(email, password));
  }

  final _$registerUserAsyncAction = AsyncAction('ApiBase.registerUser');

  @override
  Future registerUser(String email, String phoneNumber, String password) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(email, phoneNumber, password));
  }

  final _$deleteUserAsyncAction = AsyncAction('ApiBase.deleteUser');

  @override
  Future deleteUser(String userId, String token) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(userId, token));
  }

  final _$updateUserAsyncAction = AsyncAction('ApiBase.updateUser');

  @override
  Future updateUser(String email, String phoneNumber, String password,
      String userId, String token) {
    return _$updateUserAsyncAction.run(
        () => super.updateUser(email, phoneNumber, password, userId, token));
  }

  final _$createProfileAsyncAction = AsyncAction('ApiBase.createProfile');

  @override
  Future createProfile(
      String userId, String name, String cpf, String sex, String birthDate) {
    return _$createProfileAsyncAction
        .run(() => super.createProfile(userId, name, cpf, sex, birthDate));
  }

  final _$updateProfileAsyncAction = AsyncAction('ApiBase.updateProfile');

  @override
  Future updateProfile(
      String profileId, String name, String cpf, String sex, String birthDate) {
    return _$updateProfileAsyncAction
        .run(() => super.updateProfile(profileId, name, cpf, sex, birthDate));
  }

  final _$deleteProfileAsyncAction = AsyncAction('ApiBase.deleteProfile');

  @override
  Future deleteProfile(String profileId) {
    return _$deleteProfileAsyncAction.run(() => super.deleteProfile(profileId));
  }

  final _$getProfileAsyncAction = AsyncAction('ApiBase.getProfile');

  @override
  Future getProfile(String profileId) {
    return _$getProfileAsyncAction.run(() => super.getProfile(profileId));
  }

  final _$postTakenVaccineAsyncAction = AsyncAction('ApiBase.postTakenVaccine');

  @override
  Future postTakenVaccine(String profileId, String vaccineId) {
    return _$postTakenVaccineAsyncAction
        .run(() => super.postTakenVaccine(profileId, vaccineId));
  }

  final _$getTakenVaccinesAsyncAction = AsyncAction('ApiBase.getTakenVaccines');

  @override
  Future getTakenVaccines() {
    return _$getTakenVaccinesAsyncAction.run(() => super.getTakenVaccines());
  }

  final _$getVaccinesAsyncAction = AsyncAction('ApiBase.getVaccines');

  @override
  Future getVaccines() {
    return _$getVaccinesAsyncAction.run(() => super.getVaccines());
  }

  final _$getVaccineByIdAsyncAction = AsyncAction('ApiBase.getVaccineById');

  @override
  Future getVaccineById(String vacinaId) {
    return _$getVaccineByIdAsyncAction
        .run(() => super.getVaccineById(vacinaId));
  }

  final _$getProfilesByUserIdAsyncAction =
      AsyncAction('ApiBase.getProfilesByUserId');

  @override
  Future getProfilesByUserId(String userId) {
    return _$getProfilesByUserIdAsyncAction
        .run(() => super.getProfilesByUserId(userId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
