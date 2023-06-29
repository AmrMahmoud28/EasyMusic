import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class TabItem {
  final String icon, name;
  final GestureTapCallback tapEvent;
  bool isActive;
  final int timeFactor;

  TabItem({
    required this.name,
    required this.icon,
    required this.tapEvent,
    required this.isActive,
    required this.timeFactor,
  });
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentIndex = 0;

  final List<TabItem> _tabs = [
    TabItem(
      name: 'HOME',
      icon: 'assets/icons/home.svg',
      tapEvent: () {},
      isActive: true,
      timeFactor: 1,
    ),
    TabItem(
      name: 'SEARCH',
      icon: 'assets/icons/search.svg',
      tapEvent: () {},
      isActive: false,
      timeFactor: 2,
    ),
    TabItem(
      name: 'LIBRARY',
      icon: 'assets/icons/library.svg',
      tapEvent: () {},
      isActive: false,
      timeFactor: 3,
    ),
    TabItem(
      name: 'PROFILE',
      icon: 'assets/icons/profile.svg',
      tapEvent: () {},
      isActive: false,
      timeFactor: 4,
    ),
  ];

  // void _selectTab(int index) {
  //   setState(() {
  //     for (int i = 0; i < _tabs.length; i++) {
  //       if (i == index) {
  //         _tabs[i].isActive = true;
  //       } else {
  //         _tabs[i].isActive = false;
  //       }
  //     }
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return DelayedDisplay(
      delay: const Duration(milliseconds: 200),
      child: Container(
          margin: EdgeInsets.all(displayWidth * .05),
          height: displayWidth * .155,
          decoration: BoxDecoration(
              color: kTabBarColor,
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(40),
                    blurRadius: 6,
                    offset: const Offset(0, 0))
              ]),
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
              itemBuilder: (context, index) => DelayedDisplay(
                    delay:
                        Duration(milliseconds: 400 * _tabs[index].timeFactor),
                    slidingBeginOffset: const Offset(-1, 0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          HapticFeedback.lightImpact();
                          _tabs[index].tapEvent();
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? displayWidth * .32
                                : displayWidth * .18,
                            alignment: Alignment.center,
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              height: index == currentIndex
                                  ? displayWidth * .12
                                  : 0,
                              width: index == currentIndex
                                  ? displayWidth * .32
                                  : 0,
                              decoration: BoxDecoration(
                                color: index == currentIndex
                                    ? kPrimaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? displayWidth * .31
                                : displayWidth * .18,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      width: index == currentIndex
                                          ? displayWidth * .13
                                          : 0,
                                    ),
                                    AnimatedOpacity(
                                      opacity:  index == currentIndex ? 1 : 0,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: Text(
                                        index == currentIndex
                                            ? _tabs[index].name
                                            : '',
                                        style: const TextStyle(
                                          color: kTextColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      width: index == currentIndex ? displayWidth * .03 : 20,
                                    ),
                                    SvgPicture.asset(
                                      _tabs[index].icon,
                                      color: index == currentIndex ? kTextColor : Colors.white60,
                                      height: 22,
                                      ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: _tabs.map((tab) {
// return DelayedDisplay(
// delay: Duration(milliseconds: 400 * tab.timeFactor),
// slidingBeginOffset: const Offset(-1, 0),
// child: InkWell(
// onTap: () {
// _selectTab(_tabs.indexOf(tab));
// tab.tapEvent();
// },
// child: Container(
// padding: const EdgeInsets.all(5),
// height: 50,
// width: 50,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// color: tab.isActive ? kPrimaryColor : Colors.transparent),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SvgPicture.asset(
// tab.icon,
// color: kTextColor,
// height: 18,
// ),
// const SizedBox(height: 4),
// Text(
// tab.name,
// style: const TextStyle(
// color: kTextColor,
// fontSize: 9,
// fontWeight: FontWeight.bold),
// )
// ],
// ),
// ),
// ),
// );
// }).toList(),
// ),

// class TabItem extends StatefulWidget {
//   TabItem({
//     Key? key,
//     required this.icon,
//     required this.name,
//     required this.tapEvent,
//     required this.isActive,
//     required this.timeFactor,
//   }) : super(key: key);
//
//   final String icon, name;
//   final GestureTapCallback tapEvent;
//   bool isActive;
//   final int timeFactor;
//
//   @override
//   State<TabItem> createState() => _TabItemState();
// }
//
// class _TabItemState extends State<TabItem> {
//   @override
//   Widget build(BuildContext context) {
//     return DelayedDisplay(
//       delay: Duration(milliseconds: 400 * widget.timeFactor),
//       slidingBeginOffset: const Offset(-1, 0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           padding: const EdgeInsets.all(5),
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: widget.isActive ? kPrimaryColor : Colors.transparent),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 widget.icon,
//                 color: kTextColor,
//                 height: 18,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 widget.name,
//                 style: const TextStyle(
//                     color: kTextColor,
//                     fontSize: 9,
//                     fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
