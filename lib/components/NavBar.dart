import 'package:bmi_project/providers/pages.dart';
import 'package:bmi_project/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<Pages_store>(
        builder: (context, page, child) {
          return NavigationBar(
            backgroundColor: background,
            selectedIndex: page.current,

            destinations: <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home, color: secondary, size: 26,),
                label: 'Home',

              ),
              NavigationDestination(
                icon: Icon(Icons.phone, color: secondary, size: 26,),
                label: 'Calls',
              ),
              NavigationDestination(
                icon: Icon(Icons.email_outlined, color: secondary, size: 26,),
                label: 'Messages',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined, color: secondary, size: 26,),
                label: 'Contacts',
              ),
            ],
          );
        }
    );
  }
}