import 'package:flutter/material.dart';
import 'constant.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({required this.bottomText, required this.onPress});
  final String bottomText;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            bottomText,
            style: kBottomContainerTextStyle,
          ),
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kPurpleColor,
      ),
    );
  }
}
