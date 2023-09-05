import 'package:flutter/material.dart';
//import 'package:mybmi/screens/homescreen.dart';
//import 'package:device_preview/device_preview.dart';
//import 'package:mybmi/screens/hwscreen.dart';
//import 'package:mybmi/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:get/get.dart';

//import 'package:mybmi/firebase_options.dart';
//import 'package:mybmi/screens/login_page.dart';
//import 'package:mybmi/screens/main_page.dart';
//import 'package:mybmi/screens/login_page.dart';
import 'package:mybmi/screens/main_page.dart';
//import 'package:mybmi/screens/signup_page.dart';
//import 'screens/hwscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context), // <--- /!\ Add the locale
      //builder: DevicePreview.appBuilder, // <--- /!\ Add the builder
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          //olor: Color.fromARGB(255, 28, 142, 203),
          backgroundColor: Color.fromARGB(255, 12, 140, 225),
          shadowColor: Color.fromARGB(255, 230, 236, 240),
        ),
        // textTheme: const TextTheme(
        //   bodyText1: TextStyle(color: Colors.blue),
        //   bodyText2: TextStyle(color: Colors.blue),
        // ),
        primaryColor: Color.fromARGB(255, 223, 223, 229),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color.fromARGB(255, 237, 240, 242),
        ),
        // scaffoldBackgroundColor: Colors.orange[100],
      ),
      title: 'BMI Calculator',
      home: const MainPage(),
    );
  }
}
