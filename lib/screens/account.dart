import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  User user = FirebaseAuth.instance.currentUser!;
  List<File> _pickedImageList = [];

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImageListFile = await picker.pickMultiImage(
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      for (var element in pickedImageListFile!) {
        _pickedImageList.add(File(element.path));
      }
      uploadFiles(_pickedImageList);
      _pickedImageList.clear();
    });
  }

  List<String> imgList = [];
  Future<void> uploadFiles(List<File> images) async {
    await Future.wait(images.map((image) => uploadFile(image)));
    print(imgList);
  }

  Future<void> uploadFile(File _image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('added_images')
        .child(user.uid)
        .child('${DateTime.now()}.jpg');
    await ref.putFile(_image);
    imgList.add(await ref.getDownloadURL());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (ctx, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final userData = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            titleTextStyle: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Account',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'login-screen', (route) => false);
                },
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You are in Account Screen.',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  userData['username'],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  userData['email'],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  userData['phone'],
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontFamily: 'Roboto'),
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Add images'),
                  // style: Theme.of(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
