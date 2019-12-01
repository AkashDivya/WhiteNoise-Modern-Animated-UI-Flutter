/// This widget shows Category Cards when Right section is Expanded.
/// It is implemented in category_list.dart

import 'package:flutter/material.dart';

import '../main.dart';
import '../bloc/active_index_bloc.dart';
import '../bloc/active_audio_index_bloc.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();

  final int index;
  final int activeIndex;
  final String categoryTitle;
  final int totalItems;
  final String categoryTag;
  final String imagePath;
  final String categoryInfo;

  CategoryCard({
    @required this.index,
    @required this.activeIndex,
    @required this.categoryTitle,
    @required this.totalItems,
    @required this.categoryTag,
    @required this.imagePath,
    @required this.categoryInfo,
  });
}

class _CategoryCardState extends State<CategoryCard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Updates the selected Category as Active.
        activeIndexBloc.updateActiveIndex(widget.index);
        
        // Activates the first audio Item of the Category.
        activeAudioIndexBloc.updateActiveAudioIndex(0);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: normal,
            width: leftActive ? 0 : rExpanded,
            height: 20,
            child: AnimatedOpacity(
              duration: leftActive ? superFast : normal,
              opacity: leftActive ? 0 : 1,
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4.5, bottom: 8.5),
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        color: (widget.index == widget.activeIndex)
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                    height: 13,
                  ),
                  Text(
                    widget.categoryTitle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          AnimatedContainer(
            // Category Card
            duration: normal,
            width: leftActive ? 0 : rExpanded,
            height: leftActive ? 0 : 180,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 30, 30),
              alignment: Alignment.centerLeft,
              child: ListView(
                //Category Card Info
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Text(
                    widget.totalItems < 10
                        ? '0${widget.totalItems}'
                        : '${widget.totalItems}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.categoryTag,
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
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      color: leftActive
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(10, 12)),
                ],
              ),
              constraints: BoxConstraints(minHeight: 200),
            ),
          ),
          AnimatedContainer(
            duration: normal,
            height: leftActive ? 0 : 20,
          ),
          infoWidget(
            index: widget.index,
            categoryInfo: widget.categoryInfo,
            activeIndex: widget.activeIndex,
          ),
        ],
      ),
    );
  }
}

Future<Widget> showInfo(categoryInfo) async {
  Future.delayed(normal);
  return Padding(
    padding: const EdgeInsets.only(left: 70, right: 50),
    child: Column(
      children: <Widget>[
        Container(
          height: 25,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Icon(
                  IconData(0xe80b, fontFamily: 'AppIcons'),
                  size: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  IconData(0xe801, fontFamily: 'AppIcons'),
                  size: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          categoryInfo,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
            height: 1.5,
          ),
          maxLines: 5,
        ),
      ],
    ),
  );
}

Future<Widget> removeInfo() async {
  return Container(height: 0, width: 0);
}

Widget infoWidget({String categoryInfo, int index, int activeIndex}) {
  if (index == activeIndex) {
    return FutureBuilder(
        initialData: Container(height: 0, width: 0),
        future: leftActive ? removeInfo() : showInfo(categoryInfo),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data;
        });
  } else {
    return Container(height: 0, width: 0);
  }
}
