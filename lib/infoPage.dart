import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff101010),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: width * 0.9,
              child: Text(
                "The game wants to emulate the hard life of a programmer during the debbuging session. \n"
                    "Goal of the game is to eliminate every bug. \n"
                    "The bug with the highest frequency must be turned off.",
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            )
        ),
      ),
    );
  }
}