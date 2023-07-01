import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../Models/Popular.dart';
import '../../../constants.dart';

class PopularCard extends StatelessWidget {
  const PopularCard(
      {super.key, required this.popularItem, required this.index});

  final Popular popularItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DelayedDisplay(
      delay: Duration(milliseconds: 800 * index + 1),
      fadingDuration: Duration(milliseconds: 600 * index + 1),
      child: Padding(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        child: SizedBox(
          width: size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          color: Colors.black.withAlpha(40),
                          offset: const Offset(0, 0))
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(popularItem.image),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPopularCardOverlayColor.withAlpha(20)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                popularItem.title,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                popularItem.date,
                style: const TextStyle(
                  color: kTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
