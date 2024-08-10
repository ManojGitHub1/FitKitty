// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.resultTest, required this.bmiResult, required this.interpretation});

  final String resultTest;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
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
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultTest.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.only(bottom: 5),
              height: kBottomContainerHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeTextstyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// UnOrdered
// Map<String, int> phoneBook = {
//   'Kyle' : 87692079243,
//   'Aman' : 93628636864,
//   'Angela' : 6289210066,
//   'Rohan' : 98938918347,
// };
//
// main() {
//   phoneBook['Manoj'] = 87268200699;
//   print(phoneBook['Angela']);
//   print(phoneBook.length);
//   print(phoneBook.keys);
// }