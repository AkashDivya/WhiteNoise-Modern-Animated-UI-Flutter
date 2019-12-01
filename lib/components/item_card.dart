/// This widget is AudioItem under Categories. It expands and collapses.

import 'package:flutter/material.dart';

import '../main.dart';
import '../bloc/active_audio_index_bloc.dart';

Widget itemCard({
  @required int itemIndex,
  @required int activeItemIndex,
  @required String itemImagePath,
  @required String itemTitle,
}) {
  return GestureDetector(
    onTap: () {
      activeAudioIndexBloc.updateActiveAudioIndex(itemIndex);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(itemImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: (activeItemIndex == itemIndex ? playStatusWidget() : null),
        ),
        AnimatedContainer(
          duration: normal,
          width: leftActive ? lExpanded - 130 : 0,
          height: 50,
          child: AnimatedOpacity(
            opacity: leftActive ? 1 : 0,
            duration: superFast,
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 9, 20, 0),
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Text(
                  itemTitle,
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                ),
                SizedBox(height: 5),
                Text(
                  '1:34 min',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget playStatusWidget() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.8),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Icon(
      IconData(0xe800, fontFamily: 'AppIcons'),
      size: 10,
      color: Colors.white,
    ),
  );
}
