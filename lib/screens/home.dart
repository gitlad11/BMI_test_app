import 'package:bmi_project/components/DropDown.dart';
import 'package:bmi_project/components/NavBar.dart';
import 'package:bmi_project/components/Number_grade.dart';
import 'package:bmi_project/components/Search.dart';
import 'package:bmi_project/components/Top_actions.dart';
import 'package:bmi_project/providers/numbers.dart';
import 'package:bmi_project/styles/colors.dart';
import 'package:bmi_project/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:bmi_project/components/Content.dart';
import 'package:bmi_project/components/Button.dart';
import 'package:bmi_project/components/CheckBox.dart';
import 'package:bmi_project/providers/pages.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget{
  int dropdown = 0;
  int selectedButton = 0;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  onSelectedButton(index){
    setState(() {
      widget.selectedButton = index;
    });
  }
  
  
  
  var buttons = [
    { 'text' : 'SMS' },
    { 'text' : 'MMS' },
    { 'text' : 'Voice' },
  ];
  
  
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Numbers_store>(
      builder: (context, numbers, child) {
        return Scaffold(
          bottomNavigationBar: NavBar(),
          body: SingleChildScrollView(

            child: Container(
                height: MediaQuery.of(context).size.height + 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: background
                ),
                padding: const EdgeInsets.only(left: 14, right: 14, top: 45),
                child: Column(
                  children: [
                    TopActions(),
                    Content([
                      Search('Country name'),

                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                itemCount: buttons.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right : 14.0),
                                    child: Button(buttons[index]['text'] as String,
                                        MediaQuery.of(context).size.width / 3 - 38,
                                        widget.selectedButton != index,
                                            () => {onSelectedButton(index)}
                                    ),
                                  );
                                }
                            ),
                          )
                      ),
                      DropDown(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 10, left: 14),
                        child: Row(
                          children: [
                            CheckBox(),
                            SizedBox(width: 10),
                            Text('Show numbers without verification')
                          ],
                        ),
                      ),
                    ]),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(5),
                        physics: NeverScrollableScrollPhysics(),

                        itemCount: numbers.numbers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(children: [ Text(numbers.numbers[index]['country'], style: listTitleStyle) ]),
                              Content([
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: numbers.numbers[index]['items'].length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            children: [
                                              Icon(Icons.phone_android, size: 29,color: primary),
                                              SizedBox(width: 20),
                                              Column(
                                                children: [
                                                  Text(numbers.numbers[index]['items'][index],style: numberStyle),
                                                  Text('new Jersey', style: TextStyle(fontSize: 17))
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  SizedBox(width: 6),
                                                  NumberGrage('S'),
                                                  SizedBox(width: 6),
                                                  NumberGrage('V'),
                                                ],
                                              )
                                            ],
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                          ),
                                          height: 43,
                                          width: MediaQuery.of(context).size.width - 100
                                      );
                                    },

                                  )
                                )
                              ])
                            ],
                          );
                        }
                    ),
                  ],
                )
            ),
          ),
        );
      },
    );
  }
}