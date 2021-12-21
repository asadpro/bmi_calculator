import 'package:bmi_calculator/bottom_container.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kAppBarTitle,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 24.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.red, Colors.purple],
              )),
              alignment: Alignment.topCenter,
              child: Text(
                'Your Result',
                style: kYourResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: kInactiveColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: kResultText,
                  ),
                  Text(bmiResult, style: kNumberSize),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kInterPretation,
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
              bottomText: 'RE-CALCULATE YOUR BMI',
              onPress: () => Navigator.pop(context))
        ],
      ),
    );
  }
}
