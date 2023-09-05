import 'package:flutter/material.dart';
import '../widgets/colors_Hex.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(colors: [
          ColorFromHex('71C9CE'),
          ColorFromHex('A6E3E9'),
          ColorFromHex('CBF1F5'),
        ], begin: Alignment.topCenter, end: Alignment.center),
        //color: Color.fromARGB(255, 28, 142, 203),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/barbell.png',
                    fit: BoxFit.contain,
                    width:
                        size.width, // added to match the width of the container
                    height: size.height * 0.2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              //bottom: 10,
              left: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '$text...',
                style: const TextStyle(
                  color: Color.fromRGBO(8, 93, 136, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
