import 'package:bmi_project/styles/colors.dart';
import 'package:bmi_project/styles/textStyles.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget{
  List items = [
    'Landline and Mobile',
    'Somethin else'
  ];
  bool opened = false;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  onOpen(){
    setState(() {
      widget.opened = true;
    });
  }
  onSelect(int index){
    var item = widget.items[index];
    setState(() {
      widget.items.removeAt(index);
      widget.items.insert(0, item);
      widget.opened = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var opened = 38.0 * widget.items.length;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      height: widget.opened ? opened : 45,
      width: MediaQuery.of(context).size.width - 66,
      decoration: BoxDecoration(
        border: Border.all(
          color: secondary,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child:  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                if(!widget.opened){
                  onOpen();
                } else {
                  onSelect(index);
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.items[index], style: dropDownStyle),
                    index == 0 ?
                        widget.opened ? Icon(Icons.keyboard_arrow_down, size: 25, color: Colors.black54,)
                          : Icon(Icons.keyboard_arrow_up, size: 25, color: Colors.black54,)
                        : SizedBox()
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}