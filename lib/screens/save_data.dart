//import 'dart:html';

//import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:mybmi/screens/hwscreen.dart';
void save(
  name,
  address,
  //dob,
  age,
  gender,
  weight,
  height,
  bmi,
  comment,
) async {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference userdata = FirebaseFirestore.instance.collection('users');

  DateTime? datetime = DateTime.now();
  String finaldate = " ${datetime.year}-${datetime.month}-${datetime.day}";

  Map<String, dynamic> users = {
    "id": user?.uid,
    "date_time": finaldate,
    "name": name,
    'address': address,
    'gender': gender,
    //'dob': dob,
    'age': age,
    "weight": weight,
    "height": height,
    "BMI": bmi,
    "comment": comment,
  };
  await userdata.add(users);
}
