import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth.dart';
import 'package:flutter_application_1/controller/read.dart';
import 'package:flutter_application_1/controller/update.dart';

class shoulderScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ไหล่'),
          // เพิ่มปุ่มกลับในแถบแอปบาร์
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // ให้ Navigator ทำงานเพื่อกลับไปยังหน้าก่อนหน้า
              Navigator.pop(context);
            },
          ),
        ),
        // ต่อไปนี้คือเนื้อหาหน้าจอ ExerciseScreen
        // ...
      ),
    );
  }
}
