import 'package:easy_music/components/app_bar.dart';
import 'package:easy_music/constants.dart';
import 'package:easy_music/screens/home/components/body.dart';
import 'package:easy_music/screens/library/library.dart';
import 'package:easy_music/screens/profile/profile.dart';
import 'package:easy_music/screens/search/search.dart';
import 'package:flutter/material.dart';

import '../../components/tab_bar.dart';
import 'components/current_song.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;
  double _backGroundOpacity = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _opacity = 1.0 - (_scrollController.offset / 35.0).clamp(0.0, 1.0);
        _backGroundOpacity = 1.0 - (_scrollController.offset / 135.0).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context, title: "AMRak28"),
      body: NestedScrollView(
        controller: _scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          buildAppBar(context, _opacity, _backGroundOpacity, title: "AMRak28")
        ],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  renderView(0, const Body()),
                  renderView(1, const SearchScreen()),
                  renderView(2, const LibraryScreen()),
                  renderView(3, const ProfileScreen()),
                ],
              ),
            ),

            const CurrentSong(),

            CustomTabBar(
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          ],
        ),
      )

      // bottomNavigationBar: CustomTabBar(
      //   onIndexChanged: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
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
