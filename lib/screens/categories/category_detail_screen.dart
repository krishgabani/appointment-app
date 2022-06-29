import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:proj/data/categories_list.dart';
import 'package:provider/provider.dart';

import '../../data/hospitals_list.dart';
import '../../size_config.dart';
import '../hospital/hospital_box.dart';

class CategoryDetailScreen extends StatefulWidget {
  int index;
  String area;
  CategoryDetailScreen({
    required this.index,
    required this.area,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  Map<String, dynamic> _categoryDetailData = {};

  List hospitalList = [];
  List dummyLis = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceWidth = SizeConfig.screenW;
    // final index = ModalRoute.of(context)!.settings.arguments as int;
    _categoryDetailData =
        Provider.of<CategoriesList>(context).categoryListItems[widget.index];

    dummyLis = Provider.of<HospitalsList>(context)
        .getList
        .where((element) => element['category'] == _categoryDetailData['title'])
        .toList();
    if (widget.area != 'ALL') {
      hospitalList =
          dummyLis.where((element) => element['area'] == widget.area).toList();
    } else {
      hospitalList = dummyLis;
    }
    // hospitalList = dummyLis.where((ele) {
    //   return (ele['category'] as List).contains(_categoryDetailData['title']);
    // }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryDetailData['title']),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Hospitals',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            hospitalList.isEmpty
                ? Center(
                    child: Text(
                      'Oops! There is no hospitals for this.',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                : SizedBox(
                    height: 100.0 * hospitalList.length,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hospitalList.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: <Widget>[
                              HospitalBox(hospitalData: hospitalList[index]),
                              const Divider(),
                            ],
                          );
                        })),
                  ),
          ],
        ),
      ),
    );
  }
}

/* 
 return Scaffold(
      appBar: AppBar(
        title: Text(_categoryDetailData['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius:const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  _categoryDetailData['img'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 1000,),
          ],
        ),
      ),
    );
*/
