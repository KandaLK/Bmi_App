import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybmi/screens/homescreen.dart';
import 'package:mybmi/screens/hwscreen.dart';
//import 'package:mybmi/screens/homescreen.dart';
//import 'package:mybmi/screens/hwscreen.dart';

import '../widgets/colors_Hex.dart';
//import 'bmi_cal.dart';
//import 'dart:convert';

class BmiHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HWScreen()));
          },
        ),
      ),
      body: BmiHistoryList(),
      //   child: SingleChildScrollView(
      //     child: Column(children: [
      //       SizedBox(
      //         height: 20,
      //       ),
      //       BmiHistoryList(),
      //       // Container(
      //       //   height: 180,
      //       //   width: 350,
      //       //   decoration: BoxDecoration(
      //       //       color: Color.fromARGB(152, 6, 158, 158),
      //       //       borderRadius: BorderRadius.all(Radius.circular(20))),
      //       // ),
      //       // SizedBox(
      //       //   height: 20,
      //       // ),
      //       //Container(),
      //     ]),
      //   ),
      // ),
    );
  }
}

class BmiHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var bmicolor;
    // Color bmicolor = Colors.black;
    if (user == null) {
      return Center(child: Text('User not logged in'));
    }

    CollectionReference bmiCollection =
        FirebaseFirestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
      stream: bmiCollection.where('id', isEqualTo: user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No BMI data available.'));
        }

        List<Widget> bmiEntries = [];
        for (QueryDocumentSnapshot doc in snapshot.data!.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          String date = data['date_time'];
          String name = data['name'];
          int height = data['height'];
          int weight = data['weight'];
          String bmi = data['BMI'];
          String age = data['age'];
          String gender = data['gender'];
          //String address = data['address'];
          String comment = data['comment'];

          // if (weight > 0 && height > 0) {
          //   bmi = weight / ((height / 100) * (height / 100));

          if (double.parse(bmi) < 18.5) {
            bmicolor = Colors.lightBlue;
          } else if (double.parse(bmi) >= 18.5 && double.parse(bmi) < 25) {
            bmicolor = Colors.green;
          } else if (double.parse(bmi) >= 25 && double.parse(bmi) < 30) {
            bmicolor = Colors.orange;
          } else {
            bmicolor = Colors.red;
          }

          bmiEntries.add(
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                ColorFromHex('05BFDB'),
                ColorFromHex('71C9CE'),

                //ColorFromHex('DBE2EF'),
                ColorFromHex('A6E3E9'),
                //ColorFromHex('EEEEEE'),
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text(
                      'Modified Date: $date',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        backgroundColor: Color.fromARGB(119, 126, 159, 225),
                        decorationStyle: TextDecorationStyle.solid,
                        wordSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    'Name : $name\nGender : $gender\nHeight : $height cm\nWeight : $weight kg\nAge : $age',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: Text(
                  'BMI: $bmi\n$comment\t',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: bmicolor,
                  ),
                ),
                textColor: Color.fromARGB(255, 1, 4, 15),
              ),
            ),
          );
        }
        // SizedBox(
        //   height: 10,
        // );
        return ListView(
          children: bmiEntries,
        );
      },
    );
  }
}
