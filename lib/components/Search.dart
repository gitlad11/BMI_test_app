import 'package:bmi_project/styles/colors.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget{
  Search(this.placeholder);

  String placeholder = '';

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 22,
      height: 50,
      child: Row(
        children: [
          Icon(Icons.search_outlined, size: 35, color: secondary),
          SizedBox(width: 6),
          Expanded(child: TextField( decoration: InputDecoration(hintText: widget.placeholder) )),
          SizedBox(width: 6),
        ],
      ),
    );
  }
}