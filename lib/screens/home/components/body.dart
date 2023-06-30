import 'package:delayed_display/delayed_display.dart';
import 'package:easy_music/Models/PlayList.dart';
import 'package:easy_music/constants.dart';
import 'package:flutter/material.dart';

import '../../../components/title.dart';
import 'my_play_lists.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      clipBehavior: Clip.none,
      child: SafeArea(
        child: Column(
          children: [
            TitleBar(
              title: 'MY PLAYLISTS',
            ),
            MyPlayLists(),
          ],
        ),
      ),
    );
  }
}
