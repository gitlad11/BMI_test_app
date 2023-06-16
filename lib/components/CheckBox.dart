import 'package:bmi_project/styles/colors.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget{
  bool checked = true;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  onCheck(){
    setState(() {
      widget.checked = !widget.checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCheck();
      },
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(
            color: secondary,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Center(
          child: widget.checked ? Icon(Icons.check, size: 23, color: secondary) : SizedBox(),
        ),
      ),
    );
  }
}