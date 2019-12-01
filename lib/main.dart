/// This App is for demonstrating Flutter's capacity of handling multiple animations.
/// The Whole App is mainly divided into two sections; Left & Right.
/// Both of them are divided into three vertical sections; Top, Middle & Bottom.
/// Hence the whole App is structured into six sections.
/// 
/// Each sections contains various animations too.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './bloc/active_index_bloc.dart';
import './data/category_database.dart';
import './components/selected_category_section.dart';
import './components/user_card.dart';
import './components/player_controls.dart';
import './components/category_list.dart';
import './components/title_widget.dart';
import './components/menu_icon.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[50],
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.grey[50],
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

// Global Variables
double lExpanded;
double rExpanded;
double lCollapsed;
double rCollapsed;
double lMidExpanded;
double lMidCollapsed;
double rMidExpanded;
double rMidCollapsed;
Duration normal = Duration(milliseconds: 300);
Duration fast = Duration(milliseconds: 200);
Duration superFast = Duration(milliseconds: 100);
bool leftActive;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // HomePage is the main page.
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Controller for Rotation Animation.
  Animation<double> rotateAnim;
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    leftActive = true;

    rotationController = AnimationController(vsync: this, duration: superFast);
    rotateAnim =
        Tween<double>(begin: 0, end: 0.125).animate(rotationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lExpanded = 4 * MediaQuery.of(context).size.width / 5 - 0.5;
    lCollapsed = MediaQuery.of(context).size.width / 3 - 0.5;
    rExpanded = 2 * MediaQuery.of(context).size.width / 3 - 0.5;
    rCollapsed = MediaQuery.of(context).size.width / 5 - 0.5;
    lMidExpanded = MediaQuery.of(context).size.height - 2 * rCollapsed - 24;
    lMidCollapsed = MediaQuery.of(context).size.height - lExpanded - 24;
    rMidExpanded = MediaQuery.of(context).size.height - 2 * rCollapsed - 24;
    rMidCollapsed =
        MediaQuery.of(context).size.height - rCollapsed - lExpanded - 24;
  }

  void expandLeftSection() {
    // This function expands left section.
    setState(() {
      leftActive = true;
      leftActive ? rotationController.reverse() : rotationController.forward();
    });
  }

  void expandRightSection() {
    // This function expands right section.
    setState(() {
      leftActive = false;
      leftActive ? rotationController.reverse() : rotationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        // This gets the active Category's index number.
        initialData: 0,
        stream: activeIndexBloc.streamActiveIndex,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            // Base Widget.
            padding: EdgeInsets.only(top: 24),
            child: Row(
              // This Row separtaes the Left Section from the one on the Right Side.
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: AnimatedContainer(
                    //Left Section
                    duration: normal,
                    color: Colors.transparent,
                    width: leftActive ? lExpanded : lCollapsed,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Top Left Widget: App Title
                        titleWidget(),

                        // Mid Left Widget: Category Info & Contents
                        selectedCategorySection(
                          activeIndex: snapshot.data,
                          totalItems: database[snapshot.data].audioList.length,
                          categoryTag: database[snapshot.data].categoryTag,
                          imagePath: database[snapshot.data].imagePath,
                          categoryTitle: database[snapshot.data].categoryTitle,
                          trigger: expandLeftSection,
                        ),

                        // Bottom Left Widget: Player Controls
                        PlayerControls(),
                      ],
                    ),
                  ),
                ),
                Container(
                  //Seperator
                  color: Colors.grey[200],
                  width: 1,
                ),
                AnimatedContainer(
                  //Right Section
                  duration: normal,
                  color: Colors.transparent,
                  width: leftActive ? rCollapsed : rExpanded,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Top Right Widget: Rotating Menu Icon
                      menuIcon(
                        rotateAnim: rotateAnim,
                        rotationController: rotationController,
                        trigger: expandRightSection,
                      ),

                      // Middle Right Widget: List of all Categories
                      categoryList(activeIndex: snapshot.data),

                      // Bottom Right Widget: User Info Widget
                      userCard(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
