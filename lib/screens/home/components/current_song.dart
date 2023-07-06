import 'package:audioplayers/audioplayers.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../Models/Popular.dart';
import '../../../constants.dart';

class CurrentSong extends StatefulWidget {
  const CurrentSong({
    super.key,

    required this.currentSong
  });

  final Popular? currentSong;

  @override
  State<CurrentSong> createState() => _CurrentSongState();
}

class _CurrentSongState extends State<CurrentSong> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = true;
  late double currentPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);

    setSong();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == AudioPlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
        currentPosition = (position.inMilliseconds / duration.inMilliseconds) * (22 - (MediaQuery.of(context).size.width - 22)) + (MediaQuery.of(context).size.width - 22);
      });
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    currentPosition = (MediaQuery.of(context).size.width - 22);
  }

  @override
  void dispose() {
    _controller.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  void toggleTimer() async {
    if(isPlaying){
      await audioPlayer.pause();
    }
    else{
      await audioPlayer.resume();
    }
  }

  Future setSong() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    audioPlayer.setUrl(widget.currentSong!.songUrl);
    audioPlayer.resume();
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
      delay: const Duration(milliseconds: 100),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.currentSong!.image,
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.currentSong!.title,
                            style: const TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                height: 1.3
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.currentSong!.artist,
                            style: const TextStyle(
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
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 7),
                            child: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
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
                right: currentPosition,
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