import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;

class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEB1555),
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      width: double.infinity,
      height: bottomContainerHeight,
    );
  }
}
