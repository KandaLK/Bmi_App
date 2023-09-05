import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.size,
    required this.screen,
  }) : super(key: key);

  final Size size;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: 20),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.07,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 28, 142, 203),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                // padding: EdgeInsets.only(left: size.width * 0.1),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: const ListTile(
                  title: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
