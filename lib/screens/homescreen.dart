import 'package:flutter/material.dart';
import 'package:mybmi/screens/history.dart';
//import 'package:mybmi/screens/hwscreen.dart';

//import '../widgets/nextbutton.dart';
//import '../widgets/textcontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'BMI Calculator',
      //     style: TextStyle(fontSize: 20),
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: BmiHistoryPage(),
    );
  }
}
