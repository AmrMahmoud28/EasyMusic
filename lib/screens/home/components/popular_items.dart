import 'package:easy_music/screens/home/components/popular_card.dart';
import 'package:flutter/material.dart';

import '../../../Models/Popular.dart';
import '../../../constants.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: kDefaultPadding),
        child: Row(
          children: [
            ...List.generate(demoPopulars.length, (index) {
              return PopularCard(
                  popularItem: demoPopulars[index], index: index);
            })
          ],
        ),
      ),
    );
  }
}
