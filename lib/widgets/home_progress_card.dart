import 'package:flutter/material.dart';

class home_progress_card extends StatefulWidget {
  late Color color;

  home_progress_card(Color color) {
    this.color = color;
  }

  // const home_progress_card({Key? key}) : super(key: key);

  @override
  _home_progress_cardState createState() => _home_progress_cardState();
}

class _home_progress_cardState extends State<home_progress_card> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * .37,
      width: MediaQuery.of(context).size.width * .29,
      decoration: new BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.all(Radius.circular(17)),
      ),
    );
  }
}
