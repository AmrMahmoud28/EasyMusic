import 'package:easy_music/Models/Popular.dart';
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

  static void updateCurrentSong(BuildContext context, Popular popularItem) {
    final _HomeScreenState state =
        context.findAncestorStateOfType<_HomeScreenState>()!;
    state.updateCurrentSong(popularItem);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Popular? _currentSong;
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;
  double _backGroundOpacity = 1.0;
  Key _currentSongKey = UniqueKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _opacity = 1.0 - (_scrollController.offset / 35.0).clamp(0.0, 1.0);
        _backGroundOpacity =
            1.0 - (_scrollController.offset / 135.0).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  void updateCurrentSong(Popular popularItem) {
    setState(() {
      _currentSong = popularItem;
      _currentSongKey = UniqueKey();
    });
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: _currentSong != null
                ? KeyedSubtree(
                    key: _currentSongKey,
                    child: CurrentSong(currentSong: _currentSong!),
                  )
                : const SizedBox.shrink(),
          ),
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
