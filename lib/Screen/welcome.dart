import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Exercise.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'package:flutter_application_1/Screen/Post.dart';
import 'package:flutter_application_1/Screen/calendar.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:flutter_application_1/Screen/profile.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to disable the back button
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
          automaticallyImplyLeading: false, // Hide the back button
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  auth.currentUser!.email!,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: ImageIcon(
                      AssetImage(
                          "assets/image/user_outline.png"), // กำหนด path ของไฟล์รูปภาพ
                      size: 24, // กำหนดขนาดของไอคอน
                    ),
                    label: Text("Profile", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfileScreen();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Exercise", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ExerciseScreen();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Calendar", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CalendarScreen();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Statistic", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PostScreen();
                      }));
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

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout Confirmation"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                });
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
