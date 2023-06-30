import 'package:delayed_display/delayed_display.dart';
import 'package:easy_music/screens/home/components/play_list_card.dart';
import 'package:flutter/material.dart';

import '../../../Models/PlayList.dart';
import '../../../constants.dart';

class MyPlayLists extends StatelessWidget {
  const MyPlayLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding),
          child: Row(
            children: [
              ...List.generate(demoPlayLists.length, (index) {
                return PlayListCard(playListItem: demoPlayLists[index], index: index,);
              })
            ],
          ),
        )
      ],
    );
  }
}