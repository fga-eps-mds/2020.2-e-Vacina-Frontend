// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on UserControllerBase, Store {
  final _$emailAtom = Atom(name: 'UserControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: 'UserControllerBase.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$passwordAtom = Atom(name: 'UserControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$userIdAtom = Atom(name: 'UserControllerBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$tokenAtom = Atom(name: 'UserControllerBase.token');

  @override
  dynamic get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(dynamic value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$profilesAtom = Atom(name: 'UserControllerBase.profiles');

  @override
  List<dynamic> get profiles {
    _$profilesAtom.reportRead();
    return super.profiles;
  }

  @override
  set profiles(List<dynamic> value) {
    _$profilesAtom.reportWrite(value, super.profiles, () {
      super.profiles = value;
    });
  }

  final _$isRegisterAtom = Atom(name: 'UserControllerBase.isRegister');

  @override
  bool get isRegister {
    _$isRegisterAtom.reportRead();
    return super.isRegister;
  }

  @override
  set isRegister(bool value) {
    _$isRegisterAtom.reportWrite(value, super.isRegister, () {
      super.isRegister = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('UserControllerBase.login');

  @override
  Future login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  final _$logoutAsyncAction = AsyncAction('UserControllerBase.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$registerAsyncAction = AsyncAction('UserControllerBase.register');

  @override
  Future register(String email, String phoneNumber, String password,
      String name, String cpf, String sex, String birthDate) {
    return _$registerAsyncAction.run(() => super
        .register(email, phoneNumber, password, name, cpf, sex, birthDate));
  }

  final _$deleteAsyncAction = AsyncAction('UserControllerBase.delete');

  @override
  Future delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  final _$updateAsyncAction = AsyncAction('UserControllerBase.update');

  @override
  Future update(String email, String phoneNumber, String password) {
    return _$updateAsyncAction
        .run(() => super.update(email, phoneNumber, password));
  }

  final _$getProfilesAsyncAction =
      AsyncAction('UserControllerBase.getProfiles');

  @override
  Future getProfiles(String userId) {
    return _$getProfilesAsyncAction.run(() => super.getProfiles(userId));
  }

  final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePhoneNumber(String value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.changePhoneNumber');
    try {
      return super.changePhoneNumber(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUserId(String value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.changeUserId');
    try {
      return super.changeUserId(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToken(String value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.changeToken');
    try {
      return super.changeToken(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProfiles(List<dynamic> value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.changeProfiles');
    try {
      return super.changeProfiles(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeRegister(bool value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.changeRegister');
    try {
      return super.changeRegister(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
phoneNumber: ${phoneNumber},
password: ${password},
userId: ${userId},
token: ${token},
profiles: ${profiles},
isRegister: ${isRegister}
    ''';
  }
}
