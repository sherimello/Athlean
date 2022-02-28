import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:athlean/widgets/icon_content.dart';
import 'package:athlean/widgets/reusable_card.dart';
import 'package:athlean/constants.dart';
import 'fat_result_page.dart';
import 'package:athlean/widgets/bottom_button.dart';
import 'package:athlean/widgets/round_icon_button.dart';
import 'package:athlean/fat_calculation.dart';

enum Gender {
  male,
  female,
}

class FatInputPage extends StatefulWidget {
  @override
  _FatInputPageState createState() => _FatInputPageState();
}

class _FatInputPageState extends State<FatInputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;
  int waist = 96;
  int neck = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbcefe1),
      appBar: AppBar(
        title: Text('BODY FAT CALCULATOR'),
        backgroundColor: Color(0xFFCFD8DC),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/exercisebg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? Color(0xFF5CADD2)
                        : Colors.white,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? Color(0xFF5CADD2)
                        : Colors.white,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: Colors.white,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFFD6D6D6),
                        activeTrackColor: Color(0xFF1892C8),
                        thumbColor: Color(0xFF5CADD2),
                        overlayColor: Color(0x406ABCD9),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 11.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: Color(0xFF5CADD2),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WAIST',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                waist.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 60,
                                height: 55,
                                child: RaisedButton(
                                    child: Icon(FontAwesomeIcons.minus),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        waist--;
                                      });
                                    }),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: 60,
                                height: 55,
                                child: RaisedButton(
                                  child: Icon(FontAwesomeIcons.plus),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      waist++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Color(0xFF5CADD2),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'NECK',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                neck.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 60,
                                height: 55,
                                child: RaisedButton(
                                  child: Icon(FontAwesomeIcons.minus),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(
                                      () {
                                        neck--;
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: 60,
                                height: 55,
                                child: RaisedButton(
                                    child: Icon(FontAwesomeIcons.plus),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        neck++;
                                      });
                                    }),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: RaisedButton(
                  child: Text("Calculate"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: Colors.blueAccent,
                  onPressed: () {
                    FatCalculatorBrain calc = FatCalculatorBrain(
                        height: height,
                        difference: waist - neck,
                        gender: selectedGender.index);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FatResultsPage(
                          fatResult: calc.calculateFat(),
                          resultText: calc.getResult(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
