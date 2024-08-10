import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButtom extends StatelessWidget {

  BottomButtom({required this.onTap, required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(bottom: 5),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeTextstyle,
          ),
        ),
      ),
    );
  }
}
