import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DelayedDisplay(
              delay: const Duration(milliseconds: 800),
              fadingDuration: const Duration(milliseconds: 600),
              slidingBeginOffset: const Offset(-1, 0),
              child: Container(
                width: size.width * 0.3,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  child: const Text(
                    'EXPLORE',
                    style: TextStyle(
                        color: kTextColor,
                        letterSpacing: 3,
                        fontSize: 10,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: const Duration(milliseconds: 800),
              fadingDuration: const Duration(milliseconds: 600),
              slidingBeginOffset: const Offset(1, 0),
              child: Container(
                width: size.width * 0.6,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label: Image.asset('assets/images/main-logo.png'),
                  icon: const Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: kTextColor,
                        letterSpacing: 2,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    side: const BorderSide(color: Colors.white),
                  ).copyWith(side:
                  MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const BorderSide(color: kPrimaryColor);
                        }
                        return const BorderSide(color: Colors.white);
                      })),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}