/// This widget displays User's image when it is collapsed;
/// It displays name too, when expanded.
///
/// It resides on the Right-Bottom Section.

import 'package:flutter/material.dart';

import '../main.dart';

Widget userCard() {
  return AnimatedContainer(
    // Right Bottom  Widget
    duration: normal,
    height: rCollapsed,
    width: leftActive ? rCollapsed : rExpanded,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        AnimatedContainer(
          // User Name
          duration: normal,
          height: rCollapsed,
          width: leftActive ? 0 : rExpanded - rCollapsed,
          padding: EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: AnimatedOpacity(
            duration: fast,
            opacity: leftActive ? 0 : 1,
            child: Text(
              'Akash Divya',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
            ),
          ),
        ),
        Container(
          height: rCollapsed,
          width: rCollapsed,
          padding: EdgeInsets.all(20),
          child: Container(
            // User Pic
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                  image: AssetImage('assets/images/akash.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    ),
  );
}
