import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {

  final int index;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color trackColor;
  final Color activeColor;

  const CustomSwitch({@required this.index, this.value, this.onChanged, this.trackColor, this.activeColor});

  int getIndex(){
    return index;
  }

  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return  CupertinoSwitch(
      value: widget.value,
      onChanged:  widget.onChanged,
      trackColor: widget.trackColor,
      activeColor: widget.activeColor,
    );
  }
}