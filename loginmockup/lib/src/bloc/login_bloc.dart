import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);
  Stream<String> get passwordDelete =>
      _passwordController.stream.transform(validarPassword);    

  // Delete Data Stream

  Function get deleteEmail => _emailController.sink.add;

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  // insertar datos al stream
  Function get changeEmail => _emailController.sink.add;
  Function get changePassword => _passwordController.sink.add;

  String get email => _emailController.value;
  String get password => _passwordController.value;



  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
