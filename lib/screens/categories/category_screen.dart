import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/categories_list.dart';
import 'category_box.dart';

class CategoryScreen extends StatefulWidget {
  String area;

  CategoryScreen({
    required this.area,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return StreamBuilder<Object>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context,AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final area = snapshot.data['area'];
        print('Category screen --');
        print(area);
        return Scaffold(
          appBar: AppBar(
            titleTextStyle: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Categories',
            ),
          ),
          body: Column(children: [
            SizedBox(
              height: deviceSize.height * 0.03,
            ),
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: Provider.of<CategoriesList>(context).getLength(),
                itemBuilder: (context, index) {
                  return CategoryBox(
                    categoryIndex: index,
                    isHome: false,
                    area: area,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1.75,
                ),
              ),
            ),
          ]),
        );
      }
    );
  }
}
