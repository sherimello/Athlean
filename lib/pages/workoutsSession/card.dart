import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'workoutNames.dart';

import '../../constants.dart';
import '../../size_config.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key? key,
    required this.workoutitems,
    this.isFullCard = false,
    required this.press,
  }) : super(key: key);

  final WorkoutItems workoutitems;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(isFullCard ? 158 : 137),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: isFullCard ? 1.09 : 1.29,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(workoutitems.image), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            width: getProportionateScreenWidth(isFullCard ? 158 : 137),
            padding: EdgeInsets.all(
              getProportionateScreenWidth(kDefaultPadding),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [kDefualtShadow],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  workoutitems.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: isFullCard ? 17 : 12,
                  ),
                ),
                if (isFullCard)
                  Text(
                    workoutitems.date.day.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                if (isFullCard)
                  Text(
                    DateFormat.MMMM().format(workoutitems.date) +
                        " " +
                        workoutitems.date.year.toString(),
                  ),
                VerticalSpacing(of: 10),

              ],
            ),
          )
        ],
      ),
    );
  }
}