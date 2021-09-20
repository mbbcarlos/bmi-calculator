import 'package:bmicalculator/appcard.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/main.dart';
import 'package:flutter/material.dart';

import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  String bmiRes = '26.0';

  Color bmiColor = kNormalBMI;
  String bmi = 'Normal';
  String description = 'You\'re good';

  ResultsPage({
    required this.bmiRes,
    required this.bmi,
    required this.description,
  }) {
    getTextColor(bmi);
  }

  void getTextColor(String bmi) {
    if (bmi == 'Normal')
      bmiColor = kNormalBMI;
    else if (bmi == 'Overweight')
      bmiColor = kOverweightBMI;
    else
      bmiColor = kUnderweight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('YOUR RESULT',
                        style: kCaclStyle.copyWith(fontSize: 50))),
                Expanded(
                  child: AppCard(
                    color: kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          bmi,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: bmiColor),
                        ),
                        Text(
                          bmiRes,
                          style: kValueStyle.copyWith(fontSize: 100),
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                BottomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  label: 'RE-CALCULATE',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
