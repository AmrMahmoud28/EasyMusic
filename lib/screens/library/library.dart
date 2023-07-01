import 'package:easy_music/constants.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Library Screen',
          style: TextStyle(
            color: kTextColor
          ),
        ),
      ),
    );
  }
}
