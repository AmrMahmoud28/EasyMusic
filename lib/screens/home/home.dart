import 'package:easy_music/components/app_bar.dart';
import 'package:easy_music/screens/home/components/body.dart';
import 'package:easy_music/screens/library/library.dart';
import 'package:easy_music/screens/profile/profile.dart';
import 'package:easy_music/screens/search/search.dart';
import 'package:flutter/material.dart';

import '../../components/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "AMRak28"),
      body: Stack(
        children: [
          renderView(0, const Body()),
          renderView(1, const SearchScreen()),
          renderView(2, const LibraryScreen()),
          renderView(3, const ProfileScreen()),
        ],
      ),
      bottomNavigationBar: CustomTabBar(
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _currentIndex != tabIndex,
      child: Opacity(
        opacity: _currentIndex == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
