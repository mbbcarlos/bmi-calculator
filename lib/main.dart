import 'package:flutter/material.dart';

import 'constants.dart';
import 'inputpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF090C22)),
        primaryColor: const Color(0xFF090C22),
        scaffoldBackgroundColor: const Color(0xFF090F32),
        sliderTheme: const SliderThemeData(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          thumbColor: kHighlightColor,
          overlayColor: kOverlayColor,
          activeTrackColor: Colors.white,
          inactiveTrackColor: kInactiveSlider,
        ),
      ),
    );
  }
}
