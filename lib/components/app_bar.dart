import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

AppBar buildAppBar(BuildContext context, {String title = "GOOD MORNING"}) {
  final now = DateTime.now();
  String greeting = "";

  if(now.hour < 12){
    greeting = "GOOD MORNING, ";
  }
  else if(now.hour < 18){
    greeting = "GOOD AFTERNOON, ";
  }
  else{
    greeting = "GOOD EVENING, ";
  }

  return AppBar(
    backgroundColor: kBackgroundColor,
    brightness: Brightness.dark,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SvgPicture.asset('assets/images/mini-logo.svg'),
    ),
    title: FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        greeting + title,
        style: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.bold,
            // fontSize: 14,
            letterSpacing: 2),
      ),
    ),
    centerTitle: false,
    actions: [
      IconButton(
        icon: ClipOval(child: SvgPicture.asset('assets/icons/settings.svg')),
        onPressed: () {},
      )
    ],
  );
}
