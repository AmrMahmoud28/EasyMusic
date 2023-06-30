import 'package:flutter/material.dart';

import '../constants.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,

    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kTextColor,
                letterSpacing: 3
            ),
          )
        ],
      ),
    );
  }
}