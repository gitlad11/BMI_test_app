import 'package:bmi_project/components/Search.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget{
  Content(this.children);

  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width - 28,
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}