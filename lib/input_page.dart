import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'round_button.dart';
import 'bottom_container.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  int height = 170;
  double weight = 74;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: kAppBarTitle),
      body: Column(
        children: [
          // First Two cards
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Reusable_card(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 88.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'MALE',
                        style: kBodyText,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Reusable_card(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 88.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'FEMALE',
                        style: kBodyText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          // Mid single card

          Expanded(
            child: Reusable_card(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kBodyText,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberSize),
                      Text(
                        'cm',
                        style: kBodyText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 220,
                      thumbColor: kPurpleColor,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        );
                      },
                      label: height.toString(),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Last two cards
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable_card(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kBodyText,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberSize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_card(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kBodyText,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberSize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            bottomText: 'CALCULATE YOU BMI',
            onPress: () {
              setState(() {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                }));
              });
            },
          )
        ],
      ),
    );
  }
}
