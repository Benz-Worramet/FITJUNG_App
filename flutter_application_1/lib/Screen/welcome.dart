import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'package:flutter_application_1/Screen/profile.dart';

class WelcomeScreen extends StatelessWidget {
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
              Text(
                auth.currentUser!.email!,
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                  child: Text("log out"),
                  onPressed: () {
                    auth.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    });
                  }),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("profile", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProfileScreen();
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
