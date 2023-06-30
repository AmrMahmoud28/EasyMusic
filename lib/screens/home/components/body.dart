import 'package:delayed_display/delayed_display.dart';
import 'package:easy_music/Models/PlayList.dart';
import 'package:easy_music/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/title.dart';
import 'explore_button.dart';
import 'for_you.dart';
import 'my_play_lists.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return const SingleChildScrollView(
      clipBehavior: Clip.none,
      child: SafeArea(
        child: Column(
          children: [
            TitleBar(
              title: 'MY PLAYLISTS',
            ),
            MyPlayLists(),
            ExploreButton(),
            TitleBar(title: 'FOR YOU'),

            ForYou()
          ],
        ),
      ),
    );
  }
}
