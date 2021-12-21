import 'package:flutter/material.dart';
import 'constant.dart';

class Reusable_card extends StatelessWidget {
  Reusable_card({required this.cardChild});
  Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: 200.0,
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kInactiveColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
