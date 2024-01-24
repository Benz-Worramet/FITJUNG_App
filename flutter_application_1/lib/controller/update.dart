import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUser {
  final firestore = FirebaseFirestore.instance;
  Future<void> updateBmi(String uid, double bmi) async {
    await firestore.collection('user').doc(uid).update({
      'bmi': bmi,
    });
  }

  Future<void> updateWeight(String uid, double weight) async {
    await firestore.collection('user').doc(uid).update({
      'weight': weight,
    });
  }

  Future<void> updateHeight(String uid, double height) async {
    await firestore.collection('user').doc(uid).update({
      'height': height,
    });
  }

  Future<void> updateName(String uid, String name) async {
    await firestore.collection('user').doc(uid).update({
      'name': name,
    });
  }
}
