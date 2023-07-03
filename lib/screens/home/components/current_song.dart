import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CurrentSong extends StatefulWidget {
  const CurrentSong({
    super.key,
  });

  @override
  State<CurrentSong> createState() => _CurrentSongState();
}

class _CurrentSongState extends State<CurrentSong> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  Duration duration = const Duration(milliseconds: 60000);
  Duration position = Duration.zero;
  // bool isPlaying = true;
  late double currentDuration;
  Timer? timer;
  bool isTimerRunning = false;

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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    currentDuration = (MediaQuery.of(context).size.width - 22);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleTimer() {
    if (isTimerRunning) {
      timer?.cancel();
    } else {
      timer = Timer.periodic(Duration(milliseconds: 50), (_) {
        setState(() {
          currentDuration = (position.inMilliseconds / duration.inMilliseconds) * (22 - (MediaQuery.of(context).size.width - 22)) + (MediaQuery.of(context).size.width - 22);
          position += const Duration(milliseconds: 50);
          if(duration.inMilliseconds < position.inMilliseconds) {
            position = Duration.zero;
          }
        });
      });
    }
    setState(() => isTimerRunning = !isTimerRunning);
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
    return DelayedDisplay(
      delay: const Duration(milliseconds: 800),
      child: GestureDetector(
        onTap: () {
          _controller.forward().then((value) => _controller.reverse());
        },
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.95,
                child: Container(
                  height: 56,
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * .03, left: MediaQuery.of(context).size.width * .03, bottom: MediaQuery.of(context).size.width * .02),
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  padding: const EdgeInsets.all(9),
                  child: Row(
                    children: [
                      Container(
                        width: 38,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://sterling-sound.com/wp-content/uploads/Lauv-I-Like-Me-Better-2017-billboard-embed.jpg',
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                      const SizedBox(width: 8,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I Like Me Better',
                            style: TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                height: 1.3
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Lauv',
                            style: TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                height: 1.3
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      InkWell(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/icons/heart.png',
                            color: kTextColor,
                          ),
                        ),
                      ),InkWell(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {toggleTimer();},
                        child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 7),
                            child: Icon(
                              isTimerRunning ? Icons.pause : Icons.play_arrow,
                              color: kTextColor,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 22,
                right: 22,
                child: Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                          Radius.circular(7)
                      )
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 22,
                right: currentDuration,
                child: Container(
                  height: 2,
                  decoration: const BoxDecoration(
                      color: kTabBarColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(7)
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}