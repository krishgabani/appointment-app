import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../data/categories_list.dart';
import 'tab_screen.dart';
import 'categories/category_box.dart';
import 'hospital/hospital_list_view.dart';
import '../data/area.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imgList = [];
  User user = FirebaseAuth.instance.currentUser!;

  String dropdownValue = 'ALL';
  List<String> DropdownItems = areaList;

  @override
  Widget build(BuildContext context) {
    imgList = Provider.of<CategoriesList>(context).homeScreenImageSliderList;
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          dropdownValue = snapshot.data['area'];
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Center(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) async {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .update({
                      'area': dropdownValue,
                    });
                  },
                  items: DropdownItems.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(imgList[index]),
                    );
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, bottom: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      TabScreen(1, area: dropdownValue))));
                        },
                        icon: const Icon(Icons.double_arrow_rounded)),
                  ],
                ),
                SizedBox(
                  // decoration: BoxDecoration(border: Border.all()),
                  height: 115,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        Provider.of<CategoriesList>(context, listen: false)
                            .getLength(),
                    itemBuilder: ((context, index) {
                      return CategoryBox(
                        categoryIndex: index,
                        isHome: true,
                        area: dropdownValue,
                      );
                    }),
                  ),
                ),
                const Divider(),
                HospitalListView(
                  area: dropdownValue,
                ),
              ]),
            ),
          );
        });
    // });
  }
}
