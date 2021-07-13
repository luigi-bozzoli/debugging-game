import 'dart:async';

import 'package:debugging_game/BugGenerator.dart';
import 'package:debugging_game/Feedback.dart';
import 'package:debugging_game/customSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class BugList extends StatefulWidget {
  int difficulty = 0;
  int maxBugs;
  BugGenerator bugGenerator;

  BugList(this.difficulty, {this.maxBugs = 33}) {
    this.bugGenerator = new BugGenerator(difficulty, maxBugs);
    this.bugGenerator.startGame();
  }

  @override
  BugListState createState() => BugListState(this.bugGenerator);
}

class BugListState extends State<BugList> {
  TextStyle textStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  BugGenerator bugGenerator;

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  BugListState(BugGenerator bugGenerator) {
    this.bugGenerator = bugGenerator;
    isSelected[this.bugGenerator.bugList.first] = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff101010),
      body: Container(
          alignment: Alignment.center,
          child: GridView.count(
            shrinkWrap: true,
            //primary: true,
            //number of columns
            crossAxisCount: 3,
            //space between columns
            crossAxisSpacing: 0,
            //space between rows
            mainAxisSpacing: 0,
            //width-to-height ratio of the button
            childAspectRatio: 2,

            children: List.generate(isSelected.length, (index) {
              return Row(
                children: [
                  CustomSwitch(
                    trackColor: Color(0xff707070),
                    activeColor: Color(0xff00cc00),
                    index: index,
                    value: isSelected[index],
                    onChanged: (value) {
                      if (!value) {
                        bugGenerator.updateBugs(index);
                        setState(() {
                          onControlPress(index);
                        });
                      }
                    },
                  ),
                  Text(" Bug #" + index.toString(), style: textStyle)
                ],
              );
            }),
          )),
    );
  }

  onControlPress(int index) {
    bool isCorrect = bugGenerator.isCorrect;
    List newBugList = bugGenerator.newBugList;
    //isSelected[index] = !isSelected[index];

    if (bugGenerator.bugList.length == 0) {
      if (isCorrect) {
        Utility.showSuccessFloatingFlushbar(context, "Game over!",
            duration: 2200);
        new Timer(const Duration(milliseconds: 2200), () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        });
      }
    } else {
      if (isCorrect) {
        Utility.showSuccessFloatingFlushbar(context,
            bugGenerator.bugList.length.toString() + " bugs remaining!");
      }
    }

    for (int i = 0; i < isSelected.length; i++) {
      if (newBugList.contains(i)) {
        isSelected[i] = true;
      } else {
        isSelected[i] = false;
      }
    }
  }
}
