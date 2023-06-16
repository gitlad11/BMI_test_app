import 'package:bmi_project/providers/profile.dart';
import 'package:bmi_project/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopActions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<Profile_store>(
      builder: (context, profile, child) {
        return Container(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 32.0,
                backgroundImage: AssetImage(profile.profile['avatar']),
              ),
              Row(
                children: [
                  Icon(Icons.bar_chart_outlined, size: 32, color: secondary),
                  const SizedBox(width: 4,),
                  Icon(Icons.email_outlined, size: 32, color: secondary),
                  const SizedBox(width: 4,),
                  Icon(Icons.notifications_none_outlined, size: 32,color: secondary),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}