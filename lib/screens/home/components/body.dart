import 'package:easy_music/screens/home/components/popular_items.dart';
import 'package:flutter/material.dart';
import '../../../components/title.dart';
import 'artists.dart';
import 'explore_button.dart';
import 'for_you.dart';
import 'my_play_lists.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      // child: SafeArea(
        child: Column(
          children: [
            TitleBar(
              title: 'MY PLAYLISTS',
            ),
            MyPlayLists(),
            ExploreButton(),
            TitleBar(title: 'FOR YOU'),
            ForYou(),
            TitleBar(title: 'ARTISTS'),
            Artists(),
            TitleBar(title: 'POPULAR'),
            PopularItems()
          ],
        ),
      // ),
    );
  }
}
