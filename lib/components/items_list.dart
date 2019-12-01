/// This widget is a list of Audio Items

import 'package:flutter/material.dart';

import '../main.dart';
import '../data/category_database.dart';
import '../components/item_card.dart';
import '../bloc/active_audio_index_bloc.dart';

Widget itemsList({@required int activeIndex}) {
  return AnimatedContainer(
    // List of Items
    duration: normal,
    padding: leftActive
        ? EdgeInsets.only(top: 0, left: 40, right: 40)
        : EdgeInsets.only(top: 20, left: 0, right: 0),
    alignment: Alignment.topCenter,
    height: leftActive ? lMidExpanded - 340 : lMidCollapsed - rCollapsed,
    child: StreamBuilder(
      initialData: 0,
      stream: activeAudioIndexBloc.streamActiveAudioIndex,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: database[activeIndex].audioList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                itemCard(
                  activeItemIndex: snapshot.data,
                  itemIndex: index,
                  itemImagePath:
                      database[activeIndex].audioList[index].audioImagePath,
                  itemTitle: database[activeIndex].audioList[index].audioTitle,
                ),
                SizedBox(height: 25)
              ],
            );
          },
        );
      },
    ),
  );
}
