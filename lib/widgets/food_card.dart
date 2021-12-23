import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'color.dart';

class FoodCard extends StatelessWidget {
  // const FoodCard({Key? key}) : super(key: key);

  var foodName, calories;


  FoodCard(this.foodName, this.calories);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -13,
            color: kShadowColor,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/Hamburger.svg",
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  foodName,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .apply(color: Colors.white),
                ),
                Text(
                  calories,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .apply(color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset("assets/icons/menu.svg"),
          ),
        ],
      ),
    );
  }
}
