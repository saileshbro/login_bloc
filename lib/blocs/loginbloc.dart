import 'dart:async';
import 'dart:convert';
import 'package:login_bloc/validators/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Validators {
  BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  Stream<bool> get isSubmitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);
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

  submit() {
    final data = <String, String>{
      "email": _emailController.value,
      "password": _passwordController.value
    };
    // here send this to the api for authentication
    print(jsonEncode(data));
  }
}

final LoginBloc bloc = LoginBloc();
