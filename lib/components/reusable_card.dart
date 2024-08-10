import 'package:flutter/material.dart';

// the below error is caused due to immutability,
// As StatelessWidget cannot be changed so final is used to set once
// immutable must be destroyed and created again
class ReusableCard extends StatelessWidget {
  // A self developed Key Constructor(flutter doc)
  ReusableCard({super.key, required this.colour, required this.cardChild, });

  final Color colour;
  final Widget cardChild;
  // use instead creating more gesture-detector
  // final Function onPress;

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: onPress,
      return Container(
        height: 190,
        // width: 550,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      );
  }
}
