import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../Models/Artist.dart';
import '../../../constants.dart';

class ArtistCard extends StatefulWidget {
  const ArtistCard({super.key, required this.artistItem, required this.index});

  final Artist artistItem;
  final int index;

  @override
  State<ArtistCard> createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DelayedDisplay(
      delay: Duration(milliseconds: 800 * widget.index + 1),
      fadingDuration: Duration(milliseconds: 600 * widget.index + 1),
      child: Padding(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        child: GestureDetector(
          onTap: () {
            _controller.forward().then((value) => _controller.reverse());
          },
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: SizedBox(
              width: size.width * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                        child: Image.asset(widget.artistItem.image),
                      ),
                      Positioned.fill(
                        child: Container(
                          width: size.width * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                  colors: [
                                    widget.index % 2 == 1
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
                    widget.artistItem.name,
                    style: const TextStyle(
                        color: kTextColor, letterSpacing: 2, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
