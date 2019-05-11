import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/loginbloc.dart';
import 'package:login_bloc/styles/textfield.dart';
import 'package:login_bloc/styles/typography.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN', style: appBarText),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: FlutterLogo(),
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  emailField(),
                  SizedBox(height: 30),
                  passwordField(),
                  SizedBox(height: 30),
                  submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            decoration: inputField('you@example.com', 'Email', snapshot.error),
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passwordField() {
    return StreamBuilder<Object>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            decoration: inputField('Your Password', 'Password', snapshot.error),
            obscureText: true,
            onChanged: bloc.changePassword,
          );
        });
  }

  Widget submitButton() {
    return OutlineButton(
        onPressed: () {},
        borderSide: BorderSide(color: Colors.black),
        child: Text(
          'LOGIN',
          style: buttonTextStyle,
          textAlign: TextAlign.center,
        ));
  }
}
