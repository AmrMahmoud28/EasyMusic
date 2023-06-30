import 'package:delayed_display/delayed_display.dart';
import 'package:easy_music/components/app_bar.dart';
import 'package:easy_music/constants.dart';
import 'package:easy_music/screens/home/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "AMRak28"),
      body: const Body(),
      bottomNavigationBar: const CustomTabBar(),
    );
  }
}
