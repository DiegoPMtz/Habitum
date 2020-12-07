import 'dart:async';

import 'package:habitum3/bloc/valodators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator {
  final _emailcontroller = BehaviorSubject<String>();
  final _passwordcontroller = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailcontroller.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordcontroller.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);
  //insertar valores al Stream
  Function(String) get changeEmail => _emailcontroller.sink.add;
  Function(String) get changePassword => _passwordcontroller.sink.add;

//Obtener el ultimo valor ingresado a los streams
  String get email => _emailcontroller.value;
  String get password => _passwordcontroller.value;

  dispose() {
    _emailcontroller?.close();
    _passwordcontroller?.close();
  }
}
