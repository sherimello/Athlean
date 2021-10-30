import 'package:athlean/widgets/color.dart';
import 'package:athlean/widgets/home_progress_card.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: MediaQuery.of(context).padding.top * .5,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(19),
                            topRight: Radius.circular(19)),
                      )),
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
                        padding: const EdgeInsets.fromLTRB(19, 7, 19, 19),
                        child: Text(
                          'sheriMello',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new home_progress_card(CustomColor.black77),
                            new home_progress_card(CustomColor.black66),
                            new home_progress_card(CustomColor.black55),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new home_progress_card(CustomColor.black77),
                            new home_progress_card(CustomColor.black66),
                            new home_progress_card(CustomColor.black55),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new home_progress_card(CustomColor.black77),
                            new home_progress_card(CustomColor.black66),
                            new home_progress_card(CustomColor.black55),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new home_progress_card(CustomColor.black77),
                            new home_progress_card(CustomColor.black66),
                            new home_progress_card(CustomColor.black55),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new home_progress_card(CustomColor.black77),
                            new home_progress_card(CustomColor.black66),
                            new home_progress_card(CustomColor.black55),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new home_progress_card(CustomColor.black77),
                            new home_progress_card(CustomColor.black66),
                            new home_progress_card(CustomColor.black55),
                          ],
                        ),
                      ),
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
