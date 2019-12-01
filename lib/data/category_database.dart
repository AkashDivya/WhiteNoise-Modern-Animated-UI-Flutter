/// Category DataBase

import 'package:flutter/material.dart';

List<_CategoryData> database = [
  _CategoryData(
    categoryIcon: Icon(IconData(0xe80a, fontFamily: 'CategoryIcons')),
    categoryTitle: 'Rain',
    categoryTag: 'Immersed in the Rain',
    categoryInfo:
        'A collection of white noise from nature, containing some audio files.',
    imagePath: 'assets/images/cover_rain.jpg',
    audioList: [
      _AudioData(
        audioTitle: 'Ripples my Heart',
        audioLength: 72,
        audioImagePath: 'assets/images/rain_01.jpg',
      ),
      _AudioData(
        audioTitle: 'The cry of Insects',
        audioLength: 104,
        audioImagePath: 'assets/images/rain_02.jpg',
      ),
      _AudioData(
        audioTitle: 'Tears of Joy',
        audioLength: 72,
        audioImagePath: 'assets/images/rain_03.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe806, fontFamily: 'CategoryIcons')),
    categoryTitle: 'Forest',
    categoryTag: 'Being in the magical forest',
    categoryInfo:
        'A collection of white noise from nature, containing four audio files.',
    imagePath: 'assets/images/cover_forest.jpg',
    audioList: [
      _AudioData(
        audioTitle: 'Sound of Wind',
        audioLength: 72,
        audioImagePath: 'assets/images/forest_01.jpg',
      ),
      _AudioData(
        audioTitle: 'The cry of Insects',
        audioLength: 104,
        audioImagePath: 'assets/images/forest_02.jpg',
      ),
      _AudioData(
        audioTitle: 'Melody of Birds',
        audioLength: 72,
        audioImagePath: 'assets/images/forest_03.jpg',
      ),
      _AudioData(
        audioTitle: 'Melody of Birds',
        audioLength: 72,
        audioImagePath: 'assets/images/forest_04.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe808, fontFamily: 'CategoryIcons')),
    categoryTitle: 'Natural',
    categoryTag: 'Beauty of the mother\'s presence',
    categoryInfo:
        'A collection of white noise from nature, containing some audio files.',
    imagePath: 'assets/images/cover_natural.jpg',
    audioList: [
      _AudioData(
        audioTitle: 'Silence of Stones',
        audioLength: 72,
        audioImagePath: 'assets/images/natural_01.jpg',
      ),
      _AudioData(
        audioTitle: 'Lonely Mother of all',
        audioLength: 104,
        audioImagePath: 'assets/images/natural_02.jpg',
      ),
      _AudioData(
        audioTitle: 'Shine like Aurora',
        audioLength: 72,
        audioImagePath: 'assets/images/natural_03.jpg',
      ),
      _AudioData(
        audioTitle: 'Chill the Mood',
        audioLength: 104,
        audioImagePath: 'assets/images/natural_04.jpg',
      ),
      _AudioData(
        audioTitle: 'Cave calling',
        audioLength: 72,
        audioImagePath: 'assets/images/natural_05.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe805, fontFamily: 'CategoryIcons')),
    categoryTitle: 'Flow',
    categoryTag: 'Flow of max Postivity',
    categoryInfo:
        'A collection of white noise from nature, containing some audio files.',
    imagePath: 'assets/images/cover_flow.jpg',
    audioList: [
      _AudioData(
        audioTitle: 'Sound of Water',
        audioLength: 72,
        audioImagePath: 'assets/images/flow_01.jpg',
      ),
      _AudioData(
        audioTitle: 'Go with the Flow',
        audioLength: 104,
        audioImagePath: 'assets/images/flow_02.jpg',
      ),
      _AudioData(
        audioTitle: 'Melting my Heart',
        audioLength: 72,
        audioImagePath: 'assets/images/flow_03.jpg',
      ),
      _AudioData(
        audioTitle: 'Sound of Pebbles',
        audioLength: 72,
        audioImagePath: 'assets/images/flow_04.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe809, fontFamily: 'CategoryIcons')),
    categoryTitle: 'Other',
    categoryTag: 'As your heart says',
    categoryInfo:
        'A collection of white noise from nature, containing some audio files.',
    imagePath: 'assets/images/cover_other.jpg',
    audioList: [
      _AudioData(
        audioTitle: 'Sound of Wind',
        audioLength: 72,
        audioImagePath: 'assets/images/other_01.jpg',
      ),
      _AudioData(
        audioTitle: 'The cry of Insects',
        audioLength: 104,
        audioImagePath: 'assets/images/other_02.jpg',
      ),
      _AudioData(
        audioTitle: 'Melody of Birds',
        audioLength: 72,
        audioImagePath: 'assets/images/other_03.jpg',
      ),
    ],
  )
];

class _CategoryData {
  final String categoryTitle;
  final String categoryTag;
  final String imagePath;
  final String categoryInfo;
  final List<_AudioData> audioList;
  final Icon categoryIcon;

  _CategoryData({
    @required this.categoryTitle,
    @required this.categoryTag,
    @required this.imagePath,
    @required this.categoryInfo,
    @required this.audioList,
    @required this.categoryIcon,
  });
}

class _AudioData {
  final String audioTitle;
  final int audioLength;
  final String audioImagePath;

  _AudioData({
    @required this.audioTitle,
    @required this.audioLength,
    @required this.audioImagePath,
  });
}
