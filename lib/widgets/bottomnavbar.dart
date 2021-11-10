import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      // height: MediaQuery.of(context).size.height * .08,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgScr: "assets/icons/calendar.svg",
          ),
          BottomNavItem(
            title: "All Exercises",
            svgScr: "assets/icons/gym.svg",
            isActive: true,
          ),
          BottomNavItem(
            title: "Settings",
            svgScr: "assets/icons/Settings.svg",
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final void Function()? press;
  final bool isActive;

  const BottomNavItem({
    Key? key,
    required this.svgScr,
    required this.title,
    this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: SvgPicture.asset(
                svgScr,
                height: MediaQuery.of(context).size.height * .015,
                width: MediaQuery.of(context).size.height * .015,
                color: isActive ? paste : Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                title,
                // style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
                style: TextStyle(
                    fontSize: 13,
                    color: isActive ? paste : Colors.white),
              ),
            ),
          ],
        )
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: <Widget>[
        //     SvgPicture.asset(
        //       svgScr,
        //       color: isActive ? paste : Colors.white,
        //     ),
        //     Text(
        //       title,
        //       // style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
        //       style: TextStyle(color: isActive ? paste : Colors.white),
        //     ),
        //   ],
        // ),
        );
  }
}
