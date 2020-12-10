import 'dart:async';

class Validator {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Ingresa mas de 6 caracteres');
      }
    },
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      RegExp regExp = new RegExp(pattern);

      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Ingresa un correo valido');
      }
    },
  );

  final validarUser = StreamTransformer<String, String>.fromHandlers(
    handleData: (user, sink) {
      if (user.length <= 12) {
        sink.add(user);
      } else {
        sink.addError('Usuario mayor a 12 letras');
      }
    },
  );
}
