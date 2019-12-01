/// This widget shows active Category Card on the Left-Middle Section.
/// It animates too.

import 'package:flutter/material.dart';

import '../main.dart';

Widget selectedCategoryCard({
  @required int totalItems,
  @required String categoryTag,
  @required String imagePath,
}) {
  return AnimatedContainer(
    // Category Card
    duration: normal,
    width: leftActive ? lExpanded : 0,
    height: leftActive ? 230 : 0,
    padding: EdgeInsets.only(left: 40, right: 100),
    child: Container(
      padding: EdgeInsets.fromLTRB(20, 20, 30, 30),
      child: ListView(
        // Category Card Info
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            // Bookmark Icon
            alignment: Alignment.centerLeft,
            child: Icon(
              IconData(0xe802, fontFamily: 'AppIcons'),
              size: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Text(
            totalItems < 10 ? '0$totalItems' : '$totalItems',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          SizedBox(height: 10),
          Text(
            categoryTag,
            style: TextStyle(
              color: Colors.white,
              height: 1.5,
            ),
            maxLines: 2,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          // Category Image
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color:
                leftActive ? Colors.black.withOpacity(0.1) : Colors.transparent,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(10, 12),
          ),
        ],
      ),
    ),
  );
}
