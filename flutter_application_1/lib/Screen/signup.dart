import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'package:flutter_application_1/model/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: "", password: "", uid: "");
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Sign UP"),
              ),
              body: Container(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Please enter your email"),
                                EmailValidator(
                                    errorText: "please enter an email address")
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (email) {
                                profile.email = email!;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Password", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "Please enter your Password"),
                              obscureText: true,
                              onSaved: (password) {
                                profile.password = password!;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Confirm Password",
                                style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText:
                                      "Please enter your Confirm Password"),
                              obscureText: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    child: Text("Sign Up",
                                        style: TextStyle(fontSize: 20)),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        try {
                                          UserCredential result =
                                              await FirebaseAuth
                                                  .instance
                                                  .createUserWithEmailAndPassword(
                                                      email: profile.email,
                                                      password:
                                                          profile.password);
                                          User? user = result.user;
                                          await firestore
                                              .collection('user')
                                              .doc(user!.uid)
                                              .set({
                                            'email': profile.email,
                                            'uid': user.uid,
                                            'bmi': profile.bmi,
                                          }).then((value) {
                                            formKey.currentState!.reset();
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Your account has been created",
                                                gravity: ToastGravity.TOP);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return HomeScreen();
                                            }));
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          // print(e.code);
                                          // print(e.message);
                                          Fluttertoast.showToast(
                                              msg: e.message.toString(),
                                              gravity: ToastGravity.CENTER);
                                        }
                                      }
                                    },
                                  )),
                            )
                          ]),
                    )),
              )),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
