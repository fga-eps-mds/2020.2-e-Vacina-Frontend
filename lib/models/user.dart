import 'package:mobx/mobx.dart';
import 'package:mobx/mobx.dart';
part 'user.g.dart';

class User = _UserBase with _$User;

abstract class _UserBase with Store {
  @observable
  String nome;
  @action
  changeName(String value) => (nome = value);

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @observable
  String cpf;
  @action
  changeCpf(String value) => cpf = value;
}
