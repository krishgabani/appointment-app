import 'package:flutter/material.dart';

class CategoriesList with ChangeNotifier {
  final List homeScreenImageSliderList = [
    'https://picsum.photos/500/300?random=1',
    'https://picsum.photos/500/300?random=2',
    'https://picsum.photos/500/300?random=3',
    'https://picsum.photos/500/300?random=4',
    'https://picsum.photos/500/300?random=5',
  ];

  final List _categoryList = [
    {'img': 'https://picsum.photos/500/300?random=1', 'title': 'Homeopathy'},
    {'img': 'https://picsum.photos/500/300?random=2', 'title': 'Allopathy'},
    {'img': 'https://picsum.photos/500/300?random=3', 'title': 'Ayurvedic'},
    {'img': 'https://picsum.photos/500/300?random=4', 'title': 'Naturopathy'},
    {'img': 'https://picsum.photos/500/300?random=5', 'title': 'Homeopathy'},
    {'img': 'https://picsum.photos/500/300?random=6', 'title': 'Allopathy'},
    {'img': 'https://picsum.photos/500/300?random=7', 'title': 'Ayurvedic'},
    {'img': 'https://picsum.photos/500/300?random=8', 'title': 'Naturopathy'},
  ];
  List get categoryListItems {
    return _categoryList;
  }

  int getLength() {
    return _categoryList.length;
  }
}
