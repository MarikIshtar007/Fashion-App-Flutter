import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'home_screen.dart';

const users = const {'dribble@gmail.com': '12345'};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Usernames not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match!';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username does not exist';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'Fashion App',
        titleTag: 'main_text',
        onLogin: _authUser,
        onSignup: _authUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        onRecoverPassword: _recoverPassword,
        messages: LoginMessages(
          usernameHint: 'Username',
          forgotPasswordButton: 'Forgot Again?',
          recoverPasswordButton: 'Get Password',
          goBackButton: 'Back we go!',
          confirmPasswordError: 'Doesn\'t seem right',
          confirmPasswordHint: 'Confirm',
          passwordHint: 'Password',
          loginButton: 'LOG IN',
          signupButton: 'CREATE ACCOUNT',
        ),
        theme: LoginTheme(
          errorColor: Colors.red,
          accentColor: Color(0xFF423A3A),
        ),
      ),
    );
  }
}
