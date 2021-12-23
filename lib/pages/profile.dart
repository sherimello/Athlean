import 'package:athlean/widgets/home_progress_card.dart';
import 'package:athlean/widgets/profile_header_user_info_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:athlean/widgets/caloriegoalinput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:athlean/widgets/calorieburngoal.dart';
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:athlean/widgets/color.dart';
import 'package:athlean/widgets/bottomnavbar.dart';
import 'package:athlean/widgets/searchbar.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
double intake = 0;
double burn = 0;
double usage = 0;
int intakesumtoday = 0;
int intakesumyesterday = 0;

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  Future getIntake() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var calorieIntake =
        await _firestore.collection('calintake').doc(user?.email).get();
    if (calorieIntake.exists) {
      Map<String, dynamic>? data = calorieIntake.data();
      setState(() {
        intake = double.parse(data?['intake']);
      });
    }
  }

  Future getIntakeSumToday() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('foodinput')
        .where('email', isEqualTo: user?.email)
        .get();

    List<QueryDocumentSnapshot> docs = snapshot.docs;
    int tempsum = 0;
    for (var doc in docs) {
      if (doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        DateTime date = data['time'].toDate();
        if (date.isAfter(DateTime.now().subtract(Duration(hours: 24))))
          tempsum +=
              int.parse(data['kcal'].toString()); // You can get other data in this manner.
      }
      setState(() {
        intakesumtoday = tempsum;
      });
    }
  }

  Future getIntakeSumYesterday() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('foodinput')
        .where('email', isEqualTo: user?.email)
        .get();

    List<QueryDocumentSnapshot> docs = snapshot.docs;
    int tempsum = 0;
    for (var doc in docs) {
      if (doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        DateTime date = data['time'].toDate();
        if (date.isBefore(DateTime.now().subtract(Duration(hours: 24))) && date.isAfter(DateTime.now().subtract(Duration(hours: 48))))
          tempsum +=
              int.parse(data['kcal'].toString()); // You can get other data in this manner.
      }
      setState(() {
        intakesumyesterday = tempsum;
      });
    }
  }

  Future getBurn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var calorieIntake =
        await _firestore.collection('calburn').doc(user?.email).get();
    if (calorieIntake.exists) {
      Map<String, dynamic>? data = calorieIntake.data();
      setState(() {
        burn = double.parse(data?['burn']);
      });
    }
  }

  void getUsageStats() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(hours: 24));
      List<AppUsageInfo> infoList =
          await AppUsage.getAppUsage(startDate, endDate);

      double sum = 0;
      for (var info in infoList) {
        sum += (info.usage.inHours);
      }
      setState(() {
        usage = sum;
      });
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    getUsageStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    getIntake();
    getBurn();
    getIntakeSumToday();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            snap: true,
            floating: true,
            title: Text(
              "AthLean",
              textAlign: TextAlign.start,
            ),
            elevation: 0.00,
            expandedHeight: MediaQuery.of(context).size.height * .35,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(fit: StackFit.expand, children: [
                Image.asset(
                  'assets/images/home_default.jpg',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        // height: MediaQuery.of(context).padding.top * .5,
                        height: MediaQuery.of(context).padding.top,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'health profile',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(.5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(19),
                              topRight: Radius.circular(19),
                              bottomLeft: Radius.circular(19),
                              bottomRight: Radius.circular(19)),
                        )),
                  ),
                )
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(19, 7, 19, 7),
                            child: Row(
                              children: [
                                Text(
                                  "${user?.displayName}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                new profile_header_user_info_text(("(21y)"), 7,
                                    7, 7, 7, 15, FontStyle.normal),
                              ],
                            ),
                          ),
                          new profile_header_user_info_text("${user?.email}",
                              19, 0, 19, 3, 15, FontStyle.italic),
                          // new profile_header_user_info_text(
                          //     '01XXXXXXXXX', 19, 0, 19, 3, 15, FontStyle.italic),
                          Padding(
                            padding: const EdgeInsets.all(19),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 7.0),
                                  child: Icon(
                                    Icons.add_task_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'stats',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //these card are health related info cards with progress indicators...
                                //the class receives a color for card bg and progress color,
                                // a text as the card title and lastly a progress of the respective action...
                                new home_progress_card(
                                    Colors.cyan, 'Calorie\nIntake', intake, 0),
                                new home_progress_card(Colors.orangeAccent,
                                    'Calorie\nBurn', burn, 0),
                                new home_progress_card(Colors.deepPurpleAccent,
                                    'Screen\nUsage', usage, 1),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //these card are health related info cards with progress indicators...
                                //the class receives a color for card bg and progress color,
                                // a text as the card title and lastly a progress of the respective action...
                                ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) =>
                                          SingleChildScrollView(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: AddCalorieGoal(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Set Calorie Intake Goal'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.teal)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) =>
                                          SingleChildScrollView(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: AddBurnGoal(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Set Calorie Burn Goal'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.teal),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //SizedBox(height: 20),
                          //Meditation Scheduler
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Consumed Calorie",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Today",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .apply(color: Colors.white),
                                      ),
                                      Text(
                                        "${intakesumtoday.toString()} Calories",
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
                                  child:
                                      SvgPicture.asset("assets/icons/menu.svg"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Yesterday",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .apply(color: Colors.white),
                                      ),
                                      Text(
                                        "${intakesumyesterday.toString()} Calories",
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
                                  child:
                                      SvgPicture.asset("assets/icons/menu.svg"),
                                ),
                              ],
                            ),
                          ),
                          //Sleep Scheduler
                          SizedBox(height: 20),
                          //this tag is a joke...it's here just to make the UI scrollable. #asthetics XD
                          Opacity(
                            opacity: 0,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.width * .2,
                              width: double.infinity,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
