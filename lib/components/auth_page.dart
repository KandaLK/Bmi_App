import 'package:flutter/material.dart';
import 'package:mybmi/screens/hwscreen.dart';
import 'package:mybmi/screens/login_page.dart';
import 'package:mybmi/screens/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showloginpage = true;
  void toggleScreen() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage(
        showRegisterPage: toggleScreen,
      );
    } else {
      return SignupPage(
        showLoginPage: toggleScreen,
      );
    }
  }
}

void succs(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success !'),
        content: Text('Account has been created.'),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HWScreen()));
            },
          ),
        ],
      );
    },
  );
}

void bug(String error, BuildContext context) {
  // print("$error");
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Error !',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                error,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
    },
  );
}
