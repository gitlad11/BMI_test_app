import 'package:bmi_project/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:bmi_project/styles/textStyles.dart';

class Button extends StatefulWidget{
  Button(this.text, this.width, this.active, this.onClick);
  var onClick;
  String text = '';
  bool active = true;
  double width = 0;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.active ? 1.0 : 0.7,
      duration: const Duration(milliseconds: 120),
      child: InkWell(
        onTap: (){ widget.onClick(); },
        child: Container(
          width: widget.width,
          height: 40,

          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: primary,
          ),
          child: Center(child: Text(widget.text, style: buttonStyle)),
        ),
      ),
    );
  }
}