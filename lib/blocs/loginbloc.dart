import 'dart:async';

class LoginBloc {
  final StreamController<String> _emailController = StreamController<String>();
  final StreamController<String> _passwordController =
      StreamController<String>();

// getters to get email and password streams
  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;

  // getters to get the the method to add value to the sink
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
