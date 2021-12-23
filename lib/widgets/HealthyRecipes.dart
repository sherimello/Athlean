import 'package:athlean/network%20classes/Calorie.dart';
import 'package:athlean/network%20classes/Sqlite.dart';
import 'package:athlean/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'color.dart';

class HealthyRecipe extends StatefulWidget {
  final String title;

  const HealthyRecipe({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HealthyRecipe> createState() => _HealthyRecipeState();
}

class _HealthyRecipeState extends State<HealthyRecipe> {
  var name = "", cal = "kkk", fN = "", C = "";
  final TextEditingController _typeAheadController = TextEditingController();

  var _cal_listings = <Calorie>[];
  var _selected_cal_listings = <Calorie>[];

  List<Widget> _getListings() {
    // <<<<< Note this change for the return type
    var listings = <Widget>[];
    int i = 0;
    if (_cal_listings.length > 0)
      for (var food in _cal_listings) {
        listings.add(
          SeassionCard(
            whatisit: food.foodName + '\n\n',
            seassionNum: 'cal: ' + food.calorie.toString() + 'kCal',
            isDone: false,
            press: () {
              setState(() {
                _selected_cal_listings.add(new Calorie(
                    foodName: food.foodName,
                    calorie: food.calorie));
                // _getSelectedFoodListings();
              });
              // print('_cal_listings[i].foodName');
            },
          ),
        );
      }
    return listings;
  }

  List<Widget> _getSelectedFoodListings() {
    // <<<<< Note this change for the return type
    var listings = <Widget>[];
    if (_selected_cal_listings.length > 0)
      for (int i = 0; i < _selected_cal_listings.length; i++) {
        setState(() {
          listings.add(
            FoodCard(_selected_cal_listings[i].foodName,
                _selected_cal_listings[i].calorie.toString()),
          );
        });
      }
    return listings;
  }

  @override
  Widget build(BuildContext context) {
    SQLite().foods().then((List<Calorie> calorie) {
      setState(() {
        _cal_listings = calorie;
      });
    });

    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: BottomNavBar(),
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
                      widget.title,
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
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by eating healthy food",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      // width: size.width * .7, // it just take the 70% width
                      width: size.width * 1, // it just take the 70% width
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(29.5),
                          ),
                          child: Row(children: [
                            Flexible(
                              child: TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                    autofocus: false,
                                    controller: _typeAheadController,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white),
                                    decoration: InputDecoration(
                                        hintText: "Search",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: OutlineInputBorder())),
                                suggestionsCallback: (pattern) async {
                                  return await new SQLite().foodNames();
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    leading: Icon(Icons.fastfood),
                                    title: Text(suggestion.toString()),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  _typeAheadController.text =
                                      suggestion.toString();
                                  name = suggestion.toString();
                                  new SQLite()
                                      .foodCalorie(name)
                                      .then((String val) {
                                    cal = val;
                                  });
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                new SQLite()
                                    .initUserDataEntry(name, int.parse(cal));
                                _typeAheadController.text = cal;

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(cal),
                                ));
                                //
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            )
                          ])),
                    ),
                    Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children:
                            // for(int i =0; i<5; i++) {
                            //
                            // },

                            _getListings()

                        // SeassionCard(
                        //   whatisit: "Broccoli\nSalad\n",
                        //   seassionNum: 'Cal 174',
                        //   isDone: true,
                        //   press: () {},
                        // ),
                        // SeassionCard(
                        //   whatisit: "Broccoli\nSalad\n",
                        //   seassionNum: 'Cal 174',
                        //   press: () {},
                        // ),
                        // SeassionCard(
                        //   whatisit: "Broccoli \nSalad\n",
                        //   seassionNum: 'Cal 174',
                        //   press: () {},
                        // ),
                        // SeassionCard(
                        //   whatisit: "Broccoli \nSalad\n",
                        //   seassionNum: 'Cal 174',
                        //   press: () {},
                        // ),
                        // SeassionCard(
                        //   whatisit: "Broccoli \nSalad\n",
                        //   seassionNum: 'Cal 174',
                        //   press: () {},
                        // ),
                        // SeassionCard(
                        //   whatisit: "Broccoli \nSalad\n",
                        //   seassionNum: 'Cal 174',
                        //   press: () {},
                        // ),

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
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 20),
                    //   padding: EdgeInsets.all(10),
                    //   height: 90,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black87,
                    //     borderRadius: BorderRadius.circular(13),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         offset: Offset(0, 17),
                    //         blurRadius: 23,
                    //         spreadRadius: -13,
                    //         color: kShadowColor,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Row(
                    //     children: <Widget>[
                    //       SvgPicture.asset(
                    //         "assets/icons/Hamburger.svg",
                    //       ),
                    //       SizedBox(width: 20),
                    //       Expanded(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text(
                    //               "Today",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .subtitle1!
                    //                   .apply(color: Colors.white),
                    //             ),
                    //             Text(
                    //               "700 Calories",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .subtitle1!
                    //                   .apply(color: Colors.white),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(10),
                    //         child: SvgPicture.asset("assets/icons/menu.svg"),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Column(
                      children: _getSelectedFoodListings(),
                    ),
                    // FoodCard(foodName, calories)
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 20),
                    //   padding: EdgeInsets.all(10),
                    //   height: 90,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black87,
                    //     borderRadius: BorderRadius.circular(13),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         offset: Offset(0, 17),
                    //         blurRadius: 23,
                    //         spreadRadius: -13,
                    //         color: kShadowColor,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Row(
                    //     children: <Widget>[
                    //       SvgPicture.asset(
                    //         "assets/icons/Hamburger.svg",
                    //       ),
                    //       SizedBox(width: 20),
                    //       Expanded(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text(
                    //               "Yesterday",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .subtitle1!
                    //                   .apply(color: Colors.white),
                    //             ),
                    //             Text(
                    //               "2335 Calories",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .subtitle1!
                    //                   .apply(color: Colors.white),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(10),
                    //         child: SvgPicture.asset("assets/icons/menu.svg"),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .apply(color: Colors.white),
                                ),
                                Text(
                                  "Schedule Your Sleep ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
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
                    ),
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
  final Function()? press;

  SeassionCard({
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
          width: constraint.maxWidth / 2 - 10,
          // constraint.maxWidth provide us the available with for this widget
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
