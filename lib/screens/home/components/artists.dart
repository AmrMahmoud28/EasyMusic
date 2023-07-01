import 'package:flutter/material.dart';

import '../../../Models/Artist.dart';
import '../../../constants.dart';
import 'artist_card.dart';

class Artists extends StatelessWidget {
  const Artists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding),
      child: Row(
        children: [
          ...List.generate(demoArtists.length, (index) {
            return ArtistCard(
              artistItem: demoArtists[index],
              index: index,
            );
          })
        ],
      ),
    );
  }
}
