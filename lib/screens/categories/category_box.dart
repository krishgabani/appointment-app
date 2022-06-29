import 'package:flutter/material.dart';
import 'package:proj/data/categories_list.dart';
import 'package:proj/screens/categories/category_detail_screen.dart';
import 'package:provider/provider.dart';
import '../../size_config.dart';

class CategoryBox extends StatelessWidget {
  bool isHome = false;
  final int categoryIndex;
  String area;

  CategoryBox({
    Key? key,
    required this.isHome,
    required this.categoryIndex,
    required this.area,
  }) : super(key: key);

  List _categoryList = [];

  void selectCategory(BuildContext context) {
    // Navigator.of(context)
    //     .pushNamed('category-detail-screen', arguments: categoryIndex);
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => CategoryDetailScreen(
              index: categoryIndex,
              area: area,
            ))));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _categoryList = Provider.of<CategoriesList>(context).categoryListItems;
    final deviceWidth = SizeConfig.screenW;
    return InkWell(
      onTap: () {
        print('inkwell tap');
        selectCategory(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isHome
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      _categoryList[categoryIndex]['img'],
                    ),
                  ),
                )
              : SizedBox(
                  width: deviceWidth! * 0.36, // 120 , 150
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      _categoryList[categoryIndex]['img'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Text(
            _categoryList[categoryIndex]['title'],
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
