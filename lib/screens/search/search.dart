import 'package:flutter/material.dart';

import '../../constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Search Screen',
          style: TextStyle(color: kTextColor),
        ),
      ),
    );
  }
}
