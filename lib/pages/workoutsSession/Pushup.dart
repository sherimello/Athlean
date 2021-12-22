import 'package:athlean/pages/workoutsSession/card.dart';
import 'package:athlean/widgets/home_progress_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'workoutNames.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Pushup extends StatefulWidget {
  const Pushup({Key? key}) : super(key: key);

  @override
  _PushupState createState() => _PushupState();
}

class _PushupState extends State<Pushup> {
  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.fromLTRB(15, 7, 19, 7),
                        child: Row(
                          children: [
                            Text(
                              "PushUp",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "(Cal Burn - 2Kcal/min)",
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // new profile_header_user_info_text(
                      //     '01XXXXXXXXX', 19, 0, 19, 3, 15, FontStyle.italic),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(
                              'Details',
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
                        padding: const EdgeInsets.fromLTRB(15.0, 12, 12, 12),
                        child: Text(
                          'The pullup is a classic strength-building move that everyone needs to do in the gym. But whatever you do, don’t lose your form in favor of reps. Keep those legs straight for maximum payoff.',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 12, 12, 12),
                        child: Text(
                          'Your Activity records',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              new home_progress_card(
                                  Colors.cyan, 'Calorie Burn', 10),
                              new home_progress_card(
                                  Colors.redAccent, 'Workout Progress', 80),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // these card are health related info cards with progress indicators...
                            // the class receives a color for card bg and progress color,
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
                                      child: Text(
                                          'Add necessary input fields here.'),
                                    ),
                                  ),
                                );
                              },
                              child: Text('Set Calorie Burn Goal'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.cyan)),
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
                                      child: Text(
                                          'Add necessary input fields here.'),
                                    ),
                                  ),
                                );
                              },
                              child: Text('Set Workout Durations'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.redAccent),
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
