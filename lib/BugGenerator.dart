import 'dart:math';

import 'package:debugging_game/bugGenerator.dart';

class BugGenerator {
  Random rand = new Random();
  int difficulty;
  int maxBugs;
  bool isCorrect;
  List bugList = new List();
  List newBugList;

  BugGenerator(this.difficulty, this.maxBugs);

  //easy 45-35-12-8 --> 2-3-4-5
  //medium 25-30-27-18 --> 3-4-5-6
  //hard 15-20-25-27-13 --> 4-5-6-7-8
  //easy
  final int easy2bugs = 45;
  final int easy3bugs = 35;
  final int easy4bugs = 12;
  final int easy5bugs = 8;
  final int easyFirstNum = 2;
  final int easySecondNum = 3;
  final int easyThirdNum = 4;
  final int easyFourthNum = 5;
  final int easyRepeatProb = 70;
  final int easyTotBugs = 10;

  //medium
  final int medium3bugs = 25;
  final int medium4bugs = 30;
  final int medium5bugs = 27;
  final int medium6bugs = 18;
  final int mediumFirstNum = 3;
  final int mediumSecondNum = 4;
  final int mediumThirdNum = 5;
  final int mediumFourthNum = 6;
  final int mediumRepeatProb = 50;
  final int mediumTotBugs = 15;

  //hard
  final int hard4bugs = 15;
  final int hard5bugs = 20;
  final int hard6bugs = 25;
  final int hard7bugs = 27;
  final int hard8bugs = 13;
  final int hardFirstNum = 4;
  final int hardSecondNum = 5;
  final int hardThirdNum = 6;
  final int hardFourthNum = 7;
  final int hardFifthNum = 7;
  final int hardRepeatProb = 30;
  final int hardTotBugs = 20;

  void startGame() {
    switch (this.difficulty) {
      case 0:
        this.bugList = generateBugList(easyTotBugs);
        break;
      case 1:
        this.bugList = generateBugList(mediumTotBugs);
        break;
      case 2:
        this.bugList = generateBugList(hardTotBugs);
        break;
      default:
        this.bugList = generateBugList(easyTotBugs);
    }

    print(this.bugList);
  }

  List generateBugList(int dim) {
    List res = new List();

    for (int i = 0; i < dim; i++) {
      //can have same bugs
      res.add(rand.nextInt(maxBugs));
    }

    return res;
  }

  void updateBugs(int index) {
    if (this.bugList.first == index) {
      this.bugList.removeAt(0);
      this.isCorrect = true;
    } else {
      this.isCorrect = false;
    }

    generateNewBugsNumber(index);
  }

  void generateNewBugsNumber(int index) {
    if (this.bugList.length == 0) {
      this.newBugList = new List();
      return;
    }

    int x = rand.nextInt(100);
    //easy
    if (this.difficulty == 0) {
      if (x < easy2bugs) {
        //2 bugs
        updateNewBugList(easyRepeatProb, easyFirstNum, index);
      } else if (x < easy2bugs + easy3bugs && x >= easy2bugs) {
        //3 bugs
        updateNewBugList(easyRepeatProb, easySecondNum, index);
      } else if (x < easy2bugs + easy3bugs + easy4bugs &&
          x >= easy2bugs + easy3bugs) {
        //4 bugs
        updateNewBugList(easyRepeatProb, easyThirdNum, index);
      } else {
        //5 bugs
        updateNewBugList(easyRepeatProb, easyFourthNum, index);
      }
    }

    //medium
    if (this.difficulty == 1) {
      if (x < medium3bugs) {
        //4 bugs
        updateNewBugList(mediumRepeatProb, mediumFirstNum, index);
      } else if (x < medium3bugs + medium4bugs && x >= medium3bugs) {
        //4 bugs
        updateNewBugList(mediumRepeatProb, mediumSecondNum, index);
      } else if (x < medium3bugs + medium4bugs + medium5bugs &&
          x >= medium3bugs + medium4bugs) {
        //5 bugs
        updateNewBugList(mediumRepeatProb, mediumThirdNum, index);
      } else {
        //6 bugs
        updateNewBugList(mediumRepeatProb, mediumFourthNum, index);
      }
    }

    //hard
    if (this.difficulty == 2) {
      if (x < hard4bugs) {
        //4 bugs
        updateNewBugList(hardRepeatProb, hardFirstNum, index);
      } else if (x < hard4bugs + hard5bugs && x >= hard4bugs) {
        //5 bugs
        updateNewBugList(hardRepeatProb, hardSecondNum, index);
      } else if (x < hard4bugs + hard5bugs + hard6bugs &&
          x >= hard4bugs + hard5bugs) {
        //6 bugs
        updateNewBugList(hardRepeatProb, hardThirdNum, index);
      } else if (x < hard4bugs + hard5bugs + hard6bugs + hard7bugs &&
          x >= hard4bugs + hard5bugs + hard6bugs) {
        //7 bugs
        updateNewBugList(hardRepeatProb, hardFourthNum, index);
      } else {
        //8 bugs
        updateNewBugList(hardRepeatProb, hardFifthNum, index);
      }
    }
  }

  void updateNewBugList(int repeatProb, int num, int index) {
    int x = rand.nextInt(100);
    print(x);

    List res = new List();

    if (x < repeatProb) {
      res.add(bugList.first);
      res.add(generateNumberExeptInput(index, res));
    } else {
      for (int i = 0; i < num; i++) res.add(generateNumberExeptInput(index, res));
    }

    this.newBugList = res;
  }

  int generateNumberExeptInput(int nope, List res) {
    while(true){
      int x = rand.nextInt(maxBugs);
      if(x != nope && !res.contains(x))
        return x;
    }
  }
}
