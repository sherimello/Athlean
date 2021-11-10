import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'color.dart';
import 'bottomnavbar.dart';
import 'searchbar.dart';

class HealthyRecipe extends StatelessWidget {
  final String title;

  const HealthyRecipe({
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
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kGreenColor,
              image: DecorationImage(
                image: AssetImage("assets/images/healthy_recipe_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
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
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w900,color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Every Calorie Matters",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by eating healthy food",
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
                        SeassionCard(
                          whatisit: "Broccoli\nSalad\n",
                          seassionNum: 'Cal 174',
                          isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          whatisit: "Broccoli\nSalad\n",
                          seassionNum: 'Cal 174',
                          press: () {},
                        ),
                        SeassionCard(
                          whatisit: "Broccoli \nSalad\n",
                          seassionNum: 'Cal 174',
                          press: () {},
                        ),
                        SeassionCard(
                          whatisit: "Broccoli \nSalad\n",
                          seassionNum: 'Cal 174',
                          press: () {},
                        ),
                        SeassionCard(
                          whatisit: "Broccoli \nSalad\n",
                          seassionNum: 'Cal 174',
                          press: () {},
                        ),
                        SeassionCard(
                          whatisit: "Broccoli \nSalad\n",
                          seassionNum: 'Cal 174',
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    //Meditation Scheduler
                    Text(
                      "Consumed Calorie",
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
                                  "Today",
                                  style: Theme.of(context).textTheme.subtitle1!.apply(color: Colors.white),
                                ),
                                Text("700 Calories",
                                  style: Theme.of(context).textTheme.subtitle1!.apply(color: Colors.white),)
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
                                  "Yesterday",
                                  style: Theme.of(context).textTheme.subtitle1!.apply(color: Colors.white),
                                ),
                                Text("2335 Calories",
                                  style: Theme.of(context).textTheme.subtitle1!.apply(color: Colors.white),)
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
                    Text(
                      "Schedule Your Sleep",
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
                            "assets/icons/Meditation_women_small.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Daily Sleep Time",
                                  style: Theme.of(context).textTheme.subtitle1!.apply(color: Colors.white),
                                ),
                                Text("Schedule Your Sleep ",
                                    style: Theme.of(context).textTheme.subtitle2!.apply(color: Colors.white),
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
                    )
                  ],
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
  final String seassionNum;
  final bool isDone;
  final String whatisit;
  final void Function()? press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
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
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: Colors.black,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
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
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.local_drink,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "$whatisit$seassionNum",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold
                      ),
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
