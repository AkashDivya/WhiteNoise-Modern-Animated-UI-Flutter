/// This section displays the active Category, along with its
/// audio Items.
///
/// It Locates on the Left-Middle Section.

import 'package:flutter/material.dart';

import '../data/category_database.dart';
import '../main.dart';
import './selected_category_card.dart';
import './items_list.dart';

Widget selectedCategorySection({
  @required int activeIndex,
  @required Function trigger,
  @required int totalItems,
  @required String categoryTitle,
  @required String categoryTag,
  @required String imagePath,
}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      AnimatedContainer(
        duration: normal,
        height: leftActive ? lMidExpanded : lMidCollapsed,
        width: leftActive ? lExpanded : lCollapsed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AnimatedContainer(
                  // Category Title
                  duration: normal,
                  width: leftActive ? lExpanded : 0,
                  height: leftActive ? 70 : 0,
                  padding: EdgeInsets.only(left: 40, top: 10),
                  child: AnimatedOpacity(
                    duration: fast,
                    opacity: leftActive ? 1 : 0,
                    child: Text(
                      categoryTitle,
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                selectedCategoryCard(
                  categoryTag: categoryTag,
                  imagePath: imagePath,
                  totalItems: totalItems,
                ),
              ],
            ),
            SizedBox(height: 40),
            itemsList(activeIndex: activeIndex),
          ],
        ),
      ),
      Column(
        children: <Widget>[
          AnimatedContainer(
            duration: normal,
            height: leftActive ? 100 : 0,
            width: 0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: normal,
                height: 0,
                width: leftActive ? 130 : 0,
              ),
              AnimatedContainer(
                duration: normal,
                height: leftActive ? 110 : rCollapsed,
                width: leftActive ? 110 : rCollapsed,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(55),
                  boxShadow: [
                    BoxShadow(
                        color: leftActive
                            ? Colors.black.withOpacity(0.05)
                            : Colors.transparent,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(5, 5)),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    trigger();
                  },
                  icon: database[activeIndex].categoryIcon,
                  iconSize: leftActive ? 35 : 30,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
