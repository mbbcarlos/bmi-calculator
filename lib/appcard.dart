import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  Color color;
  final Widget? childCard;
  Function()? onPress;

  AppCard({required this.color, this.childCard, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
