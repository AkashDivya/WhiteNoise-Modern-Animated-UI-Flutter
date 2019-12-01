/// This widget rotates menu Icon.

import 'package:flutter/material.dart';

import '../main.dart';

Widget menuIcon({
  @required Animation<double> rotateAnim,
  @required AnimationController rotationController,
  @required Function trigger,
}) {
  return AnimatedContainer(
    duration: normal,
    height: rCollapsed,
    width: leftActive ? rCollapsed : rExpanded,
    alignment: Alignment.centerRight,
    child: Container(
      height: rCollapsed,
      width: rCollapsed,
      child: RotationTransition(
        turns: rotateAnim,
        child: IconButton(
          onPressed: () {
            trigger();
          },
          icon: Icon(
            IconData(0xe807, fontFamily: 'AppIcons'),
            size: 20,
          ),
        ),
      ),
    ),
  );
}
