import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../Models/PlayList.dart';
import '../../../constants.dart';

class PlayListCard extends StatefulWidget {
  const PlayListCard({
    super.key,

    required this.playListItem,
    required this.index
  });

  final PlayList playListItem;
  final int index;

  @override
  State<PlayListCard> createState() => _PlayListCardState();
}

class _PlayListCardState extends State<PlayListCard> with SingleTickerProviderStateMixin{
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
              width: size.width * 0.4,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              color: Colors.black.withAlpha(40),
                              offset: const Offset(0, 0)
                          )
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        widget.playListItem.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [
                                kPrimaryColor.withAlpha(30),
                                Colors.white.withAlpha(30)
                              ],
                              begin: widget.index % 2 == 1 ? Alignment.bottomCenter : Alignment.topCenter,
                              end: widget.index % 2 == 1 ? Alignment.topCenter : Alignment.bottomCenter
                          )
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.playListItem.title,
                          style: const TextStyle(
                              color: kTextColor,
                              fontSize: 18
                          ),
                        ),

                        Text(
                          widget.playListItem.date,
                          style: const TextStyle(
                              color: kTextColor,
                              fontSize: 12
                          ),
                        ),
                      ],
                    ),
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