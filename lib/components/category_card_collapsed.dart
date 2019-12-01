/// This widget shows Category Cards when Right section is Collapsed.
/// It is implemented in category_list.dart 

import 'package:flutter/material.dart';
import 'dart:math';

import '../main.dart';
import '../bloc/active_index_bloc.dart';
import '../bloc/active_audio_index_bloc.dart';

Widget categoryCardCollapsed(
    {String categoryTitle, int index, int activeIndex}) {
  return GestureDetector(
    onTap: () {
      // Updates the selected Category as Active.
      activeIndexBloc.updateActiveIndex(index);
      // Activates the first audio Item of the Category.
      activeAudioIndexBloc.updateActiveAudioIndex(0);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Transform.rotate(
          angle: -pi / 2,
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            height: rCollapsed,
            child: Text(
              categoryTitle.toUpperCase(),
              maxLines: 1,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: (index == activeIndex) ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    ),
  );
}
