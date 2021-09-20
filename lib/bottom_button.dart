import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  Function()? onTap;
  String label;

  BottomButton({required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kCaclStyle,
          ),
        ),
        height: kBottomContainerHeight,
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: kHighlightColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
