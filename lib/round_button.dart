import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.icon, this.onPress});
  final IconData icon;
  VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: Color(0xff7a8cbc),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: onPress,
      child: Icon(
        icon,
      ),
    );
  }
}
