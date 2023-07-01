import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../Models/Artist.dart';
import '../../../constants.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({super.key, required this.artistItem, required this.index});

  final Artist artistItem;
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
          width: size.width * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Image.asset(artistItem.image),
                  ),
                  Positioned.fill(
                    child: Container(
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                              colors: [
                                index % 2 == 1
                                    ? kArtistOverlayColor1.withOpacity(.2)
                                    : kArtistOverlayColor2.withOpacity(.2),
                                Colors.white.withOpacity(.2)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                artistItem.name,
                style: const TextStyle(
                    color: kTextColor, letterSpacing: 2, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
