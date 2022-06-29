import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentList with ChangeNotifier {
  User userData = FirebaseAuth.instance.currentUser!;
  List _appointmentList = [];

  List get appointmentList {
    return _appointmentList;
  }

  int get getLength {
    return _appointmentList.length;
  }

  // Future<List> getData() async {
  //   final collectionRef = FirebaseFirestore.instance
  //       .collection('data/${userData.uid}/appointments');
  //   QuerySnapshot querySnapshot = await collectionRef.get();

  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   _appointmentList = allData;
  //   notifyListeners();
  //   return _appointmentList;
  // }

  Future<void> fetchData() async {
    final collectionRef = FirebaseFirestore.instance
        .collection('data/${userData.uid}/appointments');
    QuerySnapshot querySnapshot = await collectionRef.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    _appointmentList = allData;
    notifyListeners();
  }

  Future<void> addData(
      String date, String time, Map<String, dynamic> hospitalDetail) async {
    await FirebaseFirestore.instance
        .collection('data/${userData.uid}/appointments')
        .doc(DateTime.now().toIso8601String())
        .set({
      'hospitalDetail': hospitalDetail,
      'date': date,
      'time': time,
    });
    await fetchData();
    notifyListeners();
  }
}
