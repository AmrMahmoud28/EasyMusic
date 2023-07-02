import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

SliverAppBar buildAppBar(BuildContext context, double opacity, double backGroundOpacity, {String title = "GOOD MORNING"}) {
  final now = DateTime.now();
  String greeting = "";

  if(now.hour < 6){
    greeting = "GOOD EVENING, ";
  }
  else if(now.hour < 12){
    greeting = "GOOD MORNING, ";
  }
  else if(now.hour < 18){
    greeting = "GOOD AFTERNOON, ";
  }
  else{
    greeting = "GOOD EVENING, ";
  }

  return SliverAppBar(
    floating: true,
    snap: true,
    backgroundColor: kBackgroundColor.withOpacity(backGroundOpacity),
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Opacity(opacity: opacity, child: SvgPicture.asset('assets/images/mini-logo.svg')),
    ),
    title: FittedBox(
      fit: BoxFit.fitWidth,
      child: Opacity(
        opacity: opacity,
        child: Text(
          greeting + title,
          style: const TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
              // fontSize: 14,
              letterSpacing: 2),
        ),
      ),
    ),
    centerTitle: false,
    actions: [
      Opacity(
        opacity: opacity,
        child: IconButton(
          icon: ClipOval(child: SvgPicture.asset('assets/icons/settings.svg')),
          onPressed: () {},
        ),
      )
    ], systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}
