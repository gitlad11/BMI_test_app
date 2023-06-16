import 'package:bmi_project/styles/colors.dart';
import 'package:flutter/material.dart';

class NumberGrage extends StatelessWidget{
  NumberGrage(this.grade);
  String grade =  '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: primary,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Text(grade, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white)
          )),
    );
  }
}