import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:mybmi/components/signup_control.dart';
//import 'package:mybmi/screens/login_page.dart';

import '../components/auth_page.dart';
import '../widgets/colors_Hex.dart';
//import 'package:mybmi/components/my_button.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //final user = FirebaseAuth.instance.currentUser!;

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          ColorFromHex('71C9CE'),
          ColorFromHex('A6E3E9'),
          ColorFromHex('CBF1F5'),
          // ColorFromHex('E3FDFD')
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Icon(
                      Icons.widgets_outlined,
                      size: 200,
                    ),
                    const Text(
                      'Let\'s creat an account for you',
                      style: TextStyle(
                        color: Color.fromARGB(208, 37, 43, 72),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    //const SizedBox(height: 10),

                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formkey,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Color.fromARGB(255, 14, 41, 84),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 95, 212, 225)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 99, 213, 222)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 158, 244, 250)),
                                ),
                                fillColor: Color.fromARGB(96, 13, 195, 223),
                                filled: true,
                                hintText: 'Enter Your Email ',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                suffixIcon: IconButton(
                                  onPressed: emailController.clear,
                                  icon: Icon(
                                    Icons.clear_rounded,
                                    color: Color.fromARGB(255, 14, 41, 84),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (value.length < 6) {
                                  return 'Must be 6 characters Included(numbers)';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                  color: Color.fromARGB(255, 14, 41, 84),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 95, 212, 225)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 158, 244, 250)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 158, 244, 250)),
                                ),
                                fillColor: Color.fromARGB(96, 13, 195, 223),
                                filled: true,
                                hintText: 'Enter Your Password ',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                suffixIcon: IconButton(
                                  onPressed: passwordController.clear,
                                  icon: Icon(Icons.clear_rounded),
                                  color: Color.fromARGB(255, 14, 41, 84),
                                ),
                              ),
                            ),
                          ),
                          //const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              controller: confirmPasswordController,
                              //maxLength: 25,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (passwordController.value !=
                                    confirmPasswordController.value) {
                                  return 'Confirm Password is Mismatch !';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_clock_outlined,
                                  color: Color.fromARGB(255, 14, 41, 84),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 95, 212, 225)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 158, 244, 250)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 158, 244, 250)),
                                ),
                                fillColor: Color.fromARGB(96, 13, 195, 223),
                                filled: true,
                                hintText: 'Confirm Your Password ',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),

                                //labelText: 'Enter Your Password :',
                                // labelStyle: TextStyle(
                                //     fontSize: 18,
                                //     color: Color.fromARGB(255, 255, 255, 255)
                                //         .withOpacity(0.9)),
                                suffixIcon: IconButton(
                                  onPressed: confirmPasswordController.clear,
                                  icon: Icon(Icons.clear_rounded),
                                  color: Color.fromARGB(255, 14, 41, 84),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextField(
                    //     obscureText: true,
                    //     controller: passwordController,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //         borderSide: BorderSide(color: Colors.white),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //         borderSide:
                    //             BorderSide(color: Color.fromARGB(156, 189, 189, 189)),
                    //       ),
                    //       fillColor: Color.fromARGB(193, 158, 158, 158),
                    //       filled: true,
                    //       hintText: 'Password',
                    //       suffixIcon: IconButton(
                    //         onPressed: passwordController.clear,
                    //         icon: Icon(Icons.clear_outlined),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(215, 0, 217, 255),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          if (!(_formkey.currentState!.validate())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor:
                                      Color.fromARGB(219, 214, 230, 242),
                                  elevation: CircularProgressIndicator
                                      .strokeAlignOutside,
                                  duration: Duration(
                                    seconds: 2,
                                    milliseconds: 30,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  content: Text(
                                    'Oh ! Snap \nSomething went wrong...',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Color.fromARGB(255, 8, 114, 126),
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            );
                          } else {
                            signUp();
                            succs;
                          }
                        },
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
                          'You are a member?',
                          style: TextStyle(
                              color: Color.fromARGB(220, 157, 178, 191),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text(
                            'Login Now',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(222, 37, 49, 109),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}


// class SignupPage extends StatelessWidget {
//   const SignupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         //brightness: Brightness.light,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           height: MediaQuery.of(context).size.height - 50,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const Text(
//                     "Sign up",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Create an account, It's free ",
//                     style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                   )
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   inputFile(label: "Username"),
//                   inputFile(label: "Email"),
//                   inputFile(label: "Password", obscureText: true),
//                   inputFile(label: "Confirm Password ", obscureText: true),
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.only(top: 3, left: 3),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     border: const Border(
//                       bottom: BorderSide(color: Colors.black),
//                       top: BorderSide(color: Colors.black),
//                       left: BorderSide(color: Colors.black),
//                       right: BorderSide(color: Colors.black),
//                     )),
//                 child: MaterialButton(
//                   minWidth: double.infinity,
//                   height: 60,
//                   onPressed: () {},
//                   color: Color(0xff0095FF),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: const Text(
//                     "Sign up",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Already have an account?"),
//                   Text(
//                     " Login",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // we will be creating a widget for text field
// Widget inputFile({label, obscureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: const TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color.fromARGB(255, 222, 213, 213)),
//             ),
//             border: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(color: Color.fromARGB(255, 223, 217, 217)))),
//       ),
//       const SizedBox(
//         height: 10,
//       )
//     ],
//   );
// }
