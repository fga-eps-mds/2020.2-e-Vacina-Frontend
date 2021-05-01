// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on ProfileControllerBase, Store {
  final _$currentIdAtom = Atom(name: 'ProfileControllerBase.currentId');

  @override
  dynamic get currentId {
    _$currentIdAtom.reportRead();
    return super.currentId;
  }

  @override
  set currentId(dynamic value) {
    _$currentIdAtom.reportWrite(value, super.currentId, () {
      super.currentId = value;
    });
  }

  final _$currentCpfAtom = Atom(name: 'ProfileControllerBase.currentCpf');

  @override
  String get currentCpf {
    _$currentCpfAtom.reportRead();
    return super.currentCpf;
  }

  @override
  set currentCpf(String value) {
    _$currentCpfAtom.reportWrite(value, super.currentCpf, () {
      super.currentCpf = value;
    });
  }

  final _$currentNameAtom = Atom(name: 'ProfileControllerBase.currentName');

  @override
  String get currentName {
    _$currentNameAtom.reportRead();
    return super.currentName;
  }

  @override
  set currentName(String value) {
    _$currentNameAtom.reportWrite(value, super.currentName, () {
      super.currentName = value;
    });
  }

  final _$currentSexAtom = Atom(name: 'ProfileControllerBase.currentSex');

  @override
  String get currentSex {
    _$currentSexAtom.reportRead();
    return super.currentSex;
  }

  @override
  set currentSex(String value) {
    _$currentSexAtom.reportWrite(value, super.currentSex, () {
      super.currentSex = value;
    });
  }

  final _$currentBirthDateAtom =
      Atom(name: 'ProfileControllerBase.currentBirthDate');

  @override
  String get currentBirthDate {
    _$currentBirthDateAtom.reportRead();
    return super.currentBirthDate;
  }

  @override
  set currentBirthDate(String value) {
    _$currentBirthDateAtom.reportWrite(value, super.currentBirthDate, () {
      super.currentBirthDate = value;
    });
  }

  final _$createProfileAsyncAction =
      AsyncAction('ProfileControllerBase.createProfile');

  @override
  Future createProfile(
      String userId, String name, String cpf, String sex, String birthDate) {
    return _$createProfileAsyncAction
        .run(() => super.createProfile(userId, name, cpf, sex, birthDate));
  }

  final _$deleteAsyncAction = AsyncAction('ProfileControllerBase.delete');

  @override
  Future delete(String profileId) {
    return _$deleteAsyncAction.run(() => super.delete(profileId));
  }

  final _$updateAsyncAction = AsyncAction('ProfileControllerBase.update');

  @override
  Future update(String name, String cpf, String sex, String birthDate) {
    return _$updateAsyncAction
        .run(() => super.update(name, cpf, sex, birthDate));
  }

  final _$ProfileControllerBaseActionController =
      ActionController(name: 'ProfileControllerBase');

  @override
  dynamic changeCurrentId(String value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.changeCurrentId');
    try {
      return super.changeCurrentId(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentCpf(String value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.changeCurrentCpf');
    try {
      return super.changeCurrentCpf(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentName(String value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.changeCurrentName');
    try {
      return super.changeCurrentName(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentSex(String value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.changeCurrentSex');
    try {
      return super.changeCurrentSex(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentBirthDate(String value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.changeCurrentBirthDate');
    try {
      return super.changeCurrentBirthDate(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentId: ${currentId},
currentCpf: ${currentCpf},
currentName: ${currentName},
currentSex: ${currentSex},
currentBirthDate: ${currentBirthDate}
    ''';
  }
}
