import 'dart:ui';

import 'package:athlean/pages/workoutsSession/Pushup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:athlean/widgets/color.dart';
import 'package:athlean/widgets/bottomnavbar.dart';
import 'package:athlean/widgets/searchbar.dart';
import '../pages/workoutsSession/exerciseList.dart';

class Workouts extends StatelessWidget {
  final String title;

  const Workouts({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cheese.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kGreenColor,
              image: DecorationImage(
                image: AssetImage("assets/images/home_default.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Every Calorie Matters",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width:
                            size.width * .6, // it just take 60% of total width
                        child: Text(
                          "Stay fit and healthy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        // width: size.width * .7, // it just take the 70% width
                        width: size.width * 1, // it just take the 70% width
                        child: SearchBar(),
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: <Widget>[
                          ...List.generate(
                            exercises.length,
                            (index) => SeassionCard(
                              whatisit: exercises[index].name,
                              isDone: true,
                              press: () {
                                Navigator.of(context).pushNamed(
                                  '/pushups',
                                  arguments: index,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //Meditation Scheduler
                      Text(
                        "Experts View",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 12,
                              spreadRadius: -10,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Today",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .apply(color: Colors.black),
                                  ),
                                  Text(
                                    "700 Calories",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .apply(color: Colors.black),
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
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 12,
                              spreadRadius: -10,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Yesterday",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .apply(color: Colors.black),
                                  ),
                                  Text(
                                    "2335 Calories",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .apply(color: Colors.black),
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
                      ),
                      //Sleep Scheduler
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final bool isDone;
  final String whatisit;
  final void Function()? press;
  const SeassionCard({
    Key? key,
    this.isDone = false,
    this.press,
    required this.whatisit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 12,
                spreadRadius: -10,
                color: Colors.black,
              ),
            ],
          ),
          child: Material(
            color: Colors.white10,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? Colors.redAccent : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                      ),
                      child: Icon(
                        Icons.local_drink,
                        color: isDone ? Colors.white : Colors.redAccent,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "$whatisit",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
