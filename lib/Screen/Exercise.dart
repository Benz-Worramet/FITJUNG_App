import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Exercise.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'package:flutter_application_1/Screen/Post.dart';
import 'package:flutter_application_1/Screen/arm.dart';
import 'package:flutter_application_1/Screen/breast.dart';
import 'package:flutter_application_1/Screen/calendar.dart';
import 'package:flutter_application_1/Screen/leg.dart';
import 'package:flutter_application_1/Screen/profile.dart';
import 'package:flutter_application_1/Screen/shoulder.dart';

class ExerciseScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("ขา", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return LegScreen();
                        }));
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("แขน", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ArmScreen();
                        }));
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("อก", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return BreastScreen();
                        }));
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("ไหล่", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ShoulderScreen();
                        }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

