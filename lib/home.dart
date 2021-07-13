import 'package:debugging_game/bugList.dart';
import 'package:debugging_game/infoPage.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //int intValue = 33;
  // String _chosenValue = "Easy";
  int radioValue = 0;
  TextStyle textStyle = new TextStyle(fontSize: 18.0, color: Colors.white);

  @override
  void initState() {
    super.initState();
  }

  void handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;

      /*switch (radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xff101010),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 18,
                right: 20,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.help),
                    tooltip:
                        'Info',
                    onPressed: () {
                      showAlertDialog(context);
                    },
                  ),
                ),
              ),
              /*
              Positioned(
                  top: height / 2 - 90,
                  left: width / 2 - 75,
                  child: Text("Number of bugs",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              Positioned(
                top: height / 2 - 130,
                left: width / 2 - 75,
                child: SizedBox(
                    width: 150,
                    height: 75,
                    child: NumberPicker.integer(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      selectedTextStyle:
                          TextStyle(color: Color(0xff00cc00), fontSize: 20),
                      scrollDirection: Axis.horizontal,
                      initialValue: intValue,
                      minValue: 9,
                      maxValue: 33,
                      onChanged: (value) => setState(() => intValue = value),
                    )),
              ),*/
              Positioned(
                  top: height / 2 - 150,
                  left: 75,
                  child: SizedBox(
                      width: 300,
                      child: Text(
                        "Choose difficulty:",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ))),
              Positioned(
                  top: height / 2 - 105,
                  left: width / 2 - 150,
                  child: SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        new Radio(
                          activeColor: Color(0xff00cc00),
                          focusColor: Color(0xff00cc00),
                          hoverColor: Color(0xff00cc00),
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange,
                        ),
                        new Text(
                          'Easy',
                          style: textStyle,
                        ),
                        new Radio(
                          activeColor: Color(0xff00cc00),
                          focusColor: Color(0xff00cc00),
                          hoverColor: Color(0xff00cc00),
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange,
                        ),
                        new Text(
                          'Medium',
                          style: textStyle,
                        ),
                        new Radio(
                          activeColor: Color(0xff00cc00),
                          focusColor: Color(0xff00cc00),
                          hoverColor: Color(0xff00cc00),
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange,
                        ),
                        new Text(
                          'Hard',
                          style: textStyle,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  top: height / 2 - 25,
                  left: width / 2 - 92,
                  child: SizedBox(
                    width: 184,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BugList(radioValue)));
                      },
                      child: Text(
                        'Start Debugging',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff00cc00), shape: StadiumBorder()),
                    ),
                  )),
            ],
          ),
        ));
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("Continue"),
      onPressed: () {Navigator.of(context).pop();},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Info"),
      content: Text("Turn off the most frequently occurring bug until the end."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
