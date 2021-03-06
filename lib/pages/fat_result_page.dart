import 'package:flutter/material.dart';
import 'package:athlean/constants.dart';
import 'package:athlean/widgets/reusable_card.dart';
import 'package:athlean/widgets/bottom_button.dart';

class FatResultsPage extends StatelessWidget {
  FatResultsPage(
      {this.fatResult = "", this.resultText = ""});

  final String fatResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCFD8DC),
      appBar: AppBar(
        title: Text('BODY FAT RESULT'),
        backgroundColor: Color(0xFFCFD8DC),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        fatResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        '%',
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color(0xFF212121),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
