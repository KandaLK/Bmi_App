import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:mybmi/components/auth_page.dart';
import 'package:mybmi/screens/hwscreen.dart';
//import 'package:mybmi/screens/signup_page.dart';
//import 'package:mybmi/screens/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HWScreen();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
