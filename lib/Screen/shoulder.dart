import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/armposture.dart';
import 'package:flutter_application_1/Screen/shoulderposture.dart';
import 'package:flutter_application_1/controller/auth.dart';
import 'package:flutter_application_1/controller/read.dart';
import 'package:flutter_application_1/controller/update.dart';

class ShoulderScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ไหล่'),
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
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // สีพื้นหลัง
                      minimumSize: Size(1500, 80), // ขนาดปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // มุมโค้งมน
                      ),
                    ),
                    child: Text("ท่า1", style: TextStyle(fontSize: 20, color: Colors.black)),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShoulderPosture()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}