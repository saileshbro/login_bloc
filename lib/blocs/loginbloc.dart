import 'dart:async';
import 'package:login_bloc/validators/validator.dart';

class LoginBloc with Validators {
  final StreamController<String> _emailController = StreamController<String>();
  final StreamController<String> _passwordController =
      StreamController<String>();

// getters to get email and password streams
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  // getters to get the the method to add value to the sink
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final LoginBloc bloc = LoginBloc();
