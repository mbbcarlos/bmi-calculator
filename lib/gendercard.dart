import 'package:flutter/material.dart';

import 'constants.dart';

class GenderCard extends StatelessWidget {
  final Icon icon;
  final String gender;
  GenderCard({required this.icon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: kLabelStyke,
        )
      ],
    );
  }
}
