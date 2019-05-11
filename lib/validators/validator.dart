import 'dart:async';

class Validators {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (String email, EventSink sink) {
    final RegExp exp =
        RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
    if (exp.allMatches(email).length > 0) {
      sink.add(email);
    } else {
      sink.addError('Invalid Email');
    }
  });
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, EventSink sink) {
    final RegExp exp = new RegExp(
        r"^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$");
    if (exp.allMatches(password).length > 0) {
      sink.add(password);
    } else {
      sink.addError('Invalid password');
    }
  });
}
