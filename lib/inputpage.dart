import 'package:bmicalculator/bottom_button.dart';
import 'package:bmicalculator/main.dart';
import 'package:bmicalculator/our_button.dart';
import 'package:bmicalculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_calculator.dart';
import 'appcard.dart';
import 'constants.dart';
import 'gendercard.dart';

enum Gender { female, male, empty }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kCardColor;
  Color femaleCardColor = kCardColor;
  Gender selected = Gender.empty;

  int height = kMinHeight.toInt();
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppCard(
                          onPress: () {
                            setState(() {
                              selected = Gender.male;
                            });
                          },
                          color: selected == Gender.male
                              ? kActiveCardColor
                              : kCardColor,
                          childCard: GenderCard(
                            icon: Icon(FontAwesomeIcons.mars, size: kIconSize),
                            gender: 'MALE',
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppCard(
                            onPress: () {
                              setState(() {
                                selected = Gender.female;
                              });
                            },
                            color: selected == Gender.female
                                ? kActiveCardColor
                                : kCardColor,
                            childCard: GenderCard(
                              icon:
                                  Icon(FontAwesomeIcons.venus, size: kIconSize),
                              gender: 'FEMALE',
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: AppCard(
                  color: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kLabelStyke),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kValueStyle),
                          Text('cm'),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        min: kMinHeight,
                        max: kMaxHeight,
                      )
                    ],
                  ),
                  onPress: () {},
                )),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: AppCard(
                          color: kActiveCardColor,
                          childCard: ValueWidget(
                            value: weight,
                            label: 'WEIGHT',
                            onLeftPressed: () {
                              setState(() {
                                weight = weight > 0 ? weight - 1 : weight;
                              });
                            },
                            onRightPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppCard(
                          color: kActiveCardColor,
                          childCard: ValueWidget(
                            value: age,
                            label: 'AGE',
                            onLeftPressed: () {
                              setState(() {
                                age = age > 0 ? age + 1 : age;
                              });
                            },
                            onRightPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomButton(
                  onTap: () {
                    BMICalculatorB bmiCacl =
                        BMICalculatorB(height: height, weight: weight);
                    String res = bmiCacl.calculate();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultsPage(
                          bmi: bmiCacl.getResult(),
                          bmiRes: res,
                          description: bmiCacl.getTip(),
                        );
                      }),
                    );
                  },
                  label: 'CALCULATE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ValueWidget extends StatelessWidget {
  String label;
  int value;
  Function()? onLeftPressed;
  Function()? onRightPressed;

  ValueWidget(
      {required this.value,
      required this.label,
      this.onLeftPressed,
      required this.onRightPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: kLabelStyke),
        Text(value.toString(), style: kValueStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              iconData: FontAwesomeIcons.minus,
              onPressed: onLeftPressed,
            ),
            const SizedBox(width: 10.0),
            RoundButton(
              iconData: FontAwesomeIcons.plus,
              onPressed: onRightPressed,
            )
          ],
        ),
      ],
    );
  }
}
