import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/infoposture.dart';

import 'package:flutter_application_1/Screen/legposture.dart';
import 'package:flutter_application_1/controller/auth.dart';
import 'package:flutter_application_1/controller/read.dart';
import 'package:flutter_application_1/controller/update.dart';

class LegScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ขา'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                child: Material(
                  elevation: 5, // ตั้งค่า elevation ตามที่คุณต้องการ
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // สีพื้นหลัง
                      minimumSize: Size(1500, 80), // ขนาดปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // มุมโค้งมน
                      ),
                    ),
                    child: Text("Test",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    onPressed: () {
                      _navigateToInfoPosture(
                        context,
                        'assets/video/test.mp4',
                        'ขา 1',
                      );
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _navigateToInfoPosture(
      BuildContext context, String videoPath, String detailText) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            InfoPosture(videoPath: videoPath, detailText: detailText),
      ),
    );
  }
}
