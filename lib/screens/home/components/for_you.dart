import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ForYou extends StatelessWidget {
  const ForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DelayedDisplay(
      delay: const Duration(milliseconds: 600),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kPrimaryColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: size.width * 0.35,
                height: 150,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      // left: size.width * 0.35 / 2 - 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          'assets/images/for_you.jpg',
                          width: size.width * 0.35, // / 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                width: size.width * 0.55,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Believer',
                      style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 18,),
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Song by ',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'Imagine Dragons',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '\nGenres: Pop rock',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}