import 'package:athlean/widgets/home_progress_card.dart';
import 'package:athlean/widgets/profile_header_user_info_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:athlean/widgets/caloriegoalinput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:athlean/widgets/calorieburngoal.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

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
              delegate: SliverChildListDelegate([
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
                            new profile_header_user_info_text(
                                ("(21y)"), 7, 7, 7, 7, 15, FontStyle.normal),
                          ],
                        ),
                      ),
                      new profile_header_user_info_text(
                          "${user?.email}", 19, 0, 19, 3, 15, FontStyle.italic),
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
                                Colors.cyan, 'Calorie\nIntake', 70),
                            new home_progress_card(
                                Colors.orangeAccent, 'Diet\nProgress', 20),
                            new home_progress_card(Colors.deepPurpleAccent,
                                'Workout\nProgress', 34.6),
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
                                  builder: (context) => SingleChildScrollView(
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
                                  builder: (context) => SingleChildScrollView(
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
          ]))
        ],
      ),
    );
  }
}
