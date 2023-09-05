//import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:mybmi/calculation.dart';
import 'package:mybmi/screens/homescreen.dart';
import 'package:mybmi/screens/resultscreen.dart';
//import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybmi/screens/save_data.dart';
//import 'package:mybmi/widgets/textcontainer.dart';
import '../widgets/colors_Hex.dart';
//import '../widgets/textcontainer.dart';
//import 'homescreen.dart';
import 'main_page.dart';
//import 'main_page.dart';
//import '../widgets/textcontainer.dart';
//import 'package:validators/validators.dart';
//import 'package:mybmi/widgets/textcontainer.dart';

class HWScreen extends StatefulWidget {
  const HWScreen({super.key});

  @override
  State<HWScreen> createState() => _HWScreenState();
}

class _HWScreenState extends State<HWScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _dob = TextEditingController();
  int height = 160;
  int weight = 70;
  //double bmi = 100.0;
  String mIsChecked = 'male';
  String age = '0';

  final user = FirebaseAuth.instance.currentUser!;
  final firestore = FirebaseFirestore.instance;

  String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  @override
  void dispose() {
    _address.dispose();
    _dob.dispose();
    _name.dispose();
    //_address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 10,
        automaticallyImplyLeading: false,
        title: const Text(
          ' Details Page ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 7, 34, 124),
          ),
        ),
        backgroundColor: Colors.blueAccent.withAlpha(200),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              icon: const Icon(
                Icons.logout,
                size: 20,
                color: Color.fromARGB(255, 7, 25, 82),
              )),
          IconButton(
              onPressed: () {
                //FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              icon: const Icon(
                Icons.key,
                size: 20,
                color: Color.fromARGB(255, 7, 25, 82),
              )),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 1,
      //   //mouseCursor: SystemMouseCursors.grab,
      //   //selectedFontSize: 20,
      //   //selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
      //   //selectedItemColor: Colors.amberAccent,
      //   //selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      //   //backgroundColor: Color.fromARGB(133, 2, 62, 214),

      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       // backgroundColor: Color.fromARGB(224, 0, 4, 14),
      //       icon: Icon(
      //         Icons.history_sharp,
      //         size: 30,
      //         //color: Colors.black,
      //       ),
      //       label: 'Records',
      //     ),
      //     BottomNavigationBarItem(
      //       //backgroundColor: Color.fromARGB(0, 54, 142, 25),
      //       icon: Icon(
      //         Icons.exit_to_app_sharp,
      //         size: 30,
      //       ),
      //       label: 'Exit',
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.chat),
      //     //   label: 'Chats',
      //     // ),
      //   ],
      //   // type: BottomNavigationBarType.shifting,
      // ),

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          ColorFromHex('05BFDB'),
          ColorFromHex('71C9CE'),

          //ColorFromHex('DBE2EF'),
          ColorFromHex('A6E3E9'),
          //ColorFromHex('EEEEEE'),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Scrollbar(
            thumbVisibility: false, //always show scrollbar
            thickness: 05, //width of scrollbar
            radius: Radius.circular(30), //corner radius of scrollbar
            scrollbarOrientation:
                ScrollbarOrientation.right, //which side to show scrollbar
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        const CircleImage(gender: 'male'),
                        Transform.scale(
                          scale: 1.3,
                          child: Radio<String>(
                            value: 'male',
                            groupValue: mIsChecked,
                            onChanged: (String? value) {
                              setState(() {
                                mIsChecked = value!;
                              });
                            },
                            // activeColor: Colors.green,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Color.fromARGB(255, 2, 19, 29);
                              }
                              return Color.fromARGB(255, 2, 19, 29);
                            }),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 9, 2, 30),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        const CircleImage(gender: 'female'),
                        Transform.scale(
                          scale: 1.3,
                          child: Radio<String>(
                            value: 'female',
                            groupValue: mIsChecked,
                            onChanged: (String? value) {
                              setState(() {
                                mIsChecked = value!;
                              });

                              // print('isChecked: $isChecked');
                            },
                            // activeColor: Colors.green,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Color.fromARGB(255, 1, 14, 22);
                              }
                              return Color.fromARGB(255, 1, 18, 27);
                            }),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 2, 19, 29),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 0,
                    //left: 20,
                    //right: 20,
                  ),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              right: 30,
                              left: 30,
                            ),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _name,
                              //strutStyle:StrutStyle.fromTextStyle(textStyle),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  //allow upper and lower case alphabets and space
                                  return "Enter Your Correct Name";
                                } else {
                                  return null;
                                }
                              },
                              // maxLength: 15,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.account_circle_rounded,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 2, 2)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(95, 211, 239, 243)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 209, 234, 236)),
                                ),
                                fillColor: Color.fromARGB(95, 211, 239, 243),
                                filled: true,
                                hintText: 'Name ',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                suffixIcon: IconButton(
                                  onPressed: _dob.clear,
                                  icon: const Icon(
                                    Icons.clear_rounded,
                                    color: Color.fromARGB(255, 14, 41, 84),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              right: 30,
                              left: 30,
                            ),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _address,
                              // maxLength: 25,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid Address';
                                }
                                if (!RegExp(r'^[#.0-9a-zA-Z\s,-]+$')
                                    .hasMatch(value)) {
                                  return '(Only # , . - marks can use )';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.home,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 237, 241)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 237, 241)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 237, 241)),
                                ),
                                fillColor: Color.fromARGB(95, 211, 239, 243),
                                filled: true,
                                hintText: 'Address ',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                suffixIcon: IconButton(
                                  onPressed: _dob.clear,
                                  icon: const Icon(
                                    Icons.clear_rounded,
                                    color: Color.fromARGB(255, 14, 41, 84),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 10,
                              right: 30,
                              left: 30,
                            ),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _dob,

                              validator: (value) {
                                //Error(er);
                                if (value!.isEmpty) {
                                  return 'You Must Enter Your Date OF Birth';
                                }
                                return null;
                              },
                              readOnly: true,
                              //controller: _dob,

                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.calendar_month,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 237, 241)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 237, 241)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 237, 241)),
                                ),
                                fillColor: Color.fromARGB(95, 211, 239, 243),
                                filled: true,
                                hintText: 'Date Of Birth ',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                suffixIcon: IconButton(
                                  onPressed: _dob.clear,
                                  icon: const Icon(
                                    Icons.clear_rounded,
                                    color: Color.fromARGB(255, 14, 41, 84),
                                  ),
                                ),
                              ),
                              //readOnly: true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now());
                                if (date != null) {
                                  setState(() {
                                    age = calculateAge(date);
                                  });
                                  _dob.text =
                                      DateFormat('yyyy/MM/dd').format(date);
                                }
                              },
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                  ),
                  child: Text(
                    'Height',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 4, 64, 97),
                      fontSize: 24,
                    ),
                  ),
                ),
                //Title(title: 'Height'),
                Padding(
                  padding: EdgeInsets.only(
                      //top: 20,
                      bottom: 20,
                      left: 20,
                      right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 180,
                          activeColor: const Color.fromARGB(255, 0, 19, 29),
                          inactiveColor: const Color.fromARGB(237, 9, 130, 195),
                          onChanged: (double newvalue) {
                            setState(
                              () {
                                height = newvalue.round();
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.only(right: 10),
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Color.fromARGB(255, 9, 62, 91), width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '${height}cm',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 9, 62, 91),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                  ),
                  child: Text(
                    'Weight',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 4, 64, 97),
                      fontSize: 24,
                    ),
                  ),
                ),
                // SizedBox(height: 13),
                // const Title(title: 'Weight'),
                Padding(
                  // padding: const EdgeInsets.only(right: 40.0),
                  padding: EdgeInsets.only(right: 25, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Slider(
                          value: weight.toDouble(),
                          min: 30,
                          max: 120,
                          activeColor: Color.fromARGB(246, 0, 19, 29),
                          inactiveColor: Color.fromARGB(237, 9, 130, 195),
                          onChanged: (double newvalue) {
                            setState(
                              () {
                                weight = newvalue.round();
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Color.fromARGB(255, 9, 62, 91), width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '${weight}kg',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 9, 62, 91),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.04),
                GestureDetector(
                  onTap: () {
                    if (!(_formKey.currentState!.validate()) ||
                        _name.text.isEmpty ||
                        _address.text.isEmpty ||
                        _dob.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Color.fromARGB(255, 75, 196, 212),
                            elevation:
                                CircularProgressIndicator.strokeAlignOutside,
                            duration: Duration(
                                days: 0,
                                hours: 0,
                                minutes: 0,
                                seconds: 2,
                                milliseconds: 10,
                                microseconds: 20),
                            padding: EdgeInsets.only(
                                bottom: 30, left: 10, right: 10, top: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            content: Text(
                              'Check Your Details Again !',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 8, 114, 126),
                              ),
                              textAlign: TextAlign.center,
                            )),
                      );
                    } else {
                      Calculation calc =
                          Calculation(height: height, weight: weight);
                      //if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  bmiResult: calc.calculateBMI(),
                                  resultText: calc.result(),
                                  interpretation: calc.getInterpretation(),
                                  name: _name.text,
                                  address: _address.text,
                                  dob: age.toString(),
                                  mIsChecked: mIsChecked,
                                )),
                      );
                      save(_name.text, _address.text, age, mIsChecked, weight,
                          height, calc.calculateBMI(), calc.result());
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, bottom: 45),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width * 0.7,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 83, 128),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Padding(
                            // padding: EdgeInsets.only(left: size.width * 0.1),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: const ListTile(
                              title: Text(
                                'Calculate your BMI',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              trailing: Icon(Icons.arrow_forward,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 210, 214, 216),
        ),
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.gender,
  }) : super(key: key);

  final String gender;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Color.fromARGB(255, 4, 128, 195),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/$gender.png'),
      ),
    );
  }
}
