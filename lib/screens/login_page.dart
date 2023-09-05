//import 'dart:html';
//import 'package:flutter/material/colors.dart';
//import 'dart:js';
//import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:mybmi/screens/signup_page.dart';
import 'package:mybmi/widgets/colors_Hex.dart';
//import 'package:mybmi/components/my_button.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //final user = FirebaseAuth.instance.currentUser!;
  Future signIn() async {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    //Navigator.pop(context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(241, 237, 222, 222),
      body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsetsDirectional.all(100),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              ColorFromHex('71C9CE'),
              ColorFromHex('A6E3E9'),
              ColorFromHex('CBF1F5'),
              //ColorFromHex('E3FDFD')
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: SafeArea(
            bottom: false,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/images/healthcare.png',
                      scale: 2.2,
                      color: Color.fromARGB(203, 6, 99, 122),
                    ),
                    const Text(
                      'Welcome back. you\'ve been missed !',
                      style: TextStyle(
                        color: Color.fromARGB(243, 1, 60, 76),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 95, 212, 225)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 158, 244, 250)),
                          ),
                          fillColor: Color.fromARGB(96, 13, 195, 223),
                          filled: true,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          suffixIcon: IconButton(
                            onPressed: emailController.clear,
                            icon: const Icon(
                              Icons.clear_outlined,
                              color: Color.fromARGB(255, 14, 41, 84),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 95, 212, 225)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 158, 244, 250)),
                          ),
                          fillColor: Color.fromARGB(96, 13, 195, 223),
                          filled: true,
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          suffixIcon: IconButton(
                            onPressed: passwordController.clear,
                            icon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 14, 41, 84),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password ?',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 14, 41, 84),
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(215, 0, 217, 255),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                        onTap: signIn,
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'not a member? ',
                          style: TextStyle(
                              color: Color.fromARGB(220, 157, 178, 191),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.showRegisterPage,
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(222, 37, 49, 109),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 210,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
