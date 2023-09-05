//import 'dart:js';

//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybmi/screens/homescreen.dart';
//import 'package:mybmi/screens/homescreen.dart';
//import 'package:mybmi/screens/homescreen.dart';
import 'package:mybmi/screens/hwscreen.dart';
//import 'package:mybmi/screens/login_page.dart';
import 'package:mybmi/screens/main_page.dart';

import '../widgets/colors_Hex.dart';

//import '../widgets/textcontainer.dart';

//import 'hwscreen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
    required this.name,
    required this.address,
    required this.dob,
    required this.mIsChecked,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String name;
  final String address;
  final String dob;
  final String mIsChecked;
  final user = FirebaseAuth.instance.currentUser!;

  // Widget _buildCoverImage(Size screenSize) {
  //   return Container(
  //     height: 100,
  //     decoration: BoxDecoration(
  //       color: Color.fromARGB(255, 28, 142, 203),
  //       image: DecorationImage(
  //         image: AssetImage('assets/images/barbell.png'),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 234, 233, 232),
          image: DecorationImage(
            image: AssetImage('assets/images/$mIsChecked.png'),
            scale: 0.7,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(90.0),
          border: Border.all(
            color: Color.fromARGB(255, 16, 116, 170),
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    return Text(
      'Hi $name',
      style: TextStyle(
        //fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      // decoration: BoxDecoration(
      //   color: Theme.of(context).scaffoldBackgroundColor,
      //   borderRadius: BorderRadius.circular(4.0),
      // ),
      child: Text(
        'Your Address $address',
        style: TextStyle(
          //fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  var bmicolor;

  Widget _buildStatItem(String label, String count) {
    var bmi = double.parse(bmiResult);
    if ((bmi) < 18.5) {
      bmicolor = Colors.lightBlue;
    } else if ((bmi) >= 18.5 && (bmi) < 25) {
      bmicolor = Colors.green;
    } else if ((bmi) >= 25 && (bmi) < 30) {
      bmicolor = Colors.orange;
    } else {
      bmicolor = Colors.red;
    }
    TextStyle _statLabelTextStyle = TextStyle(
      //fontFamily: 'Roboto',
      color: Color.fromARGB(255, 5, 14, 113),
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: bmicolor,
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    //var value = double.parse(bmiResult);
    return Container(
      height: 100.0,

      //margin: EdgeInsets.only(top: 20.0, bottom: 60),
      decoration: BoxDecoration(
          //color: Color.fromARGB(0, 76, 235, 219),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("AGE", dob),
          _buildStatItem("BMI Value", bmiResult),
          _buildStatItem("Status", resultText),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      //fontFamily: 'Spectral',
      fontWeight: FontWeight.w600, //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,

      color: bmicolor,
      fontSize: 22.0,
    );

    return Container(
      //color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(10.0),
      child: Text(
        interpretation,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  // Widget _buildSeparator(Size screenSize) {
  //   return Container(
  //     width: screenSize.width / 1.6,
  //     height: 2.0,
  //     color: Colors.black54,
  //     margin: EdgeInsets.only(top: 4.0),
  //   );
  // }

  Widget _buildGetInTouch(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(50),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Container(
                  height: 50.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 12, 117, 155),
                  ),
                  child: const Center(
                    child: Text(
                      "Show Previous Records",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(width: 10.0),
          ],
        ));
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HWScreen()),
                );
              },
              child: Container(
                height: 50.0,
                width: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 14, 105, 138),
                ),
                child: const Center(
                  child: Text(
                    "Calculate Again",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildSignout(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 40, right: 40, top: 10),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: GestureDetector(
  //             onTap: () {
  //               FirebaseAuth.instance.signOut();
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => MainPage()),
  //               );
  //             },
  //             child: Container(
  //               height: 50.0,
  //               width: 10.0,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(30),
  //                 color: Color.fromARGB(255, 12, 117, 155),
  //               ),
  //               child: const Center(
  //                 child: Text(
  //                   "Sign Out",
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         //SizedBox(width: 10.0),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          ' Result Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 7, 25, 82),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              //mouseCursor: SystemMouseCursors.grab,
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 7, 25, 82),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          ColorFromHex('05BFDB'),
          ColorFromHex('71C9CE'),

          //ColorFromHex('DBE2EF'),
          ColorFromHex('A6E3E9'),
          //ColorFromHex('EEEEEE'),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Stack(
          //clipBehavior: Clip.antiAlias,
          children: <Widget>[
            //_buildCoverImage(screenSize),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  //SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(),

                  _buildFullName(),
                  _buildStatus(context),
                  SizedBox(height: 30.0),
                  _buildStatContainer(),
                  SizedBox(height: 40.0),
                  _buildBio(context),
                  //_buildSeparator(screenSize),
                  //SizedBox(height: 10.0),
                  _buildGetInTouch(context),
                  SizedBox(height: 10.0),
                  _buildButtons(context),
                  //SizedBox(height: 40),
                  //_buildSignout(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
