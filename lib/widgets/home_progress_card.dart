import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

String indic = "";
class home_progress_card extends StatefulWidget {
  late Color color; //color of the card and the progress indicator
  var text; //title of the card
  double progress;
  int flag;
  //progress of the progress indicator

  home_progress_card(this.color, this.text, this.progress, this.flag);

  @override
  _home_progress_cardState createState() => _home_progress_cardState();
}

class _home_progress_cardState extends State<home_progress_card> {
  @override
  Widget build(BuildContext context) {
    if (widget.flag == 1)
      indic = "hr";
    else
      indic = "%";
    return InkWell(
      child: Container(
        // height: MediaQuery.of(context).size.width * .37,
        width: MediaQuery.of(context).size.width * .29,
        decoration: new BoxDecoration(
          color: widget.color.withOpacity(.5),
          borderRadius: BorderRadius.all(Radius.circular(17)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: new CircularPercentIndicator(
                    radius: 71,
                    lineWidth: 7.0,
                    animation: true,
                    animateFromLastPercent: false,
                    animationDuration: 1200,
                    percent: widget.progress * .01,
                    backgroundColor: Colors.white,
                    center: new Text((widget.progress).toStringAsFixed(1) + indic),
                    progressColor: widget.color,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
