// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccineController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VaccineController on VaccineControllerBase, Store {
  final _$takenVaccinesAtom = Atom(name: 'VaccineControllerBase.takenVaccines');

  @override
  List<dynamic> get takenVaccines {
    _$takenVaccinesAtom.reportRead();
    return super.takenVaccines;
  }

  @override
  set takenVaccines(List<dynamic> value) {
    _$takenVaccinesAtom.reportWrite(value, super.takenVaccines, () {
      super.takenVaccines = value;
    });
  }

  final _$getVaccinesAsyncAction =
      AsyncAction('VaccineControllerBase.getVaccines');

  @override
  Future getVaccines() {
    return _$getVaccinesAsyncAction.run(() => super.getVaccines());
  }

  final _$getTakenVaccineAsyncAction =
      AsyncAction('VaccineControllerBase.getTakenVaccine');

  @override
  Future getTakenVaccine() {
    return _$getTakenVaccineAsyncAction.run(() => super.getTakenVaccine());
  }

  final _$postTakenVaccineAsyncAction =
      AsyncAction('VaccineControllerBase.postTakenVaccine');

  @override
  Future postTakenVaccine(String vaccineId) {
    return _$postTakenVaccineAsyncAction
        .run(() => super.postTakenVaccine(vaccineId));
  }

  final _$VaccineControllerBaseActionController =
      ActionController(name: 'VaccineControllerBase');

  @override
  dynamic changeTakenVaccine(List<dynamic> value) {
    final _$actionInfo = _$VaccineControllerBaseActionController.startAction(
        name: 'VaccineControllerBase.changeTakenVaccine');
    try {
      return super.changeTakenVaccine(value);
    } finally {
      _$VaccineControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
takenVaccines: ${takenVaccines}
    ''';
  }
}
