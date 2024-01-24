import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth.dart';
import 'package:flutter_application_1/controller/read.dart';
import 'package:flutter_application_1/controller/update.dart';

class ProfileScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: BmiCalculatorWidget(),
        ),
      ),
    );
  }
}

class BmiCalculatorWidget extends StatefulWidget {
  @override
  _BmiCalculatorWidgetState createState() => _BmiCalculatorWidgetState();
}

class _BmiCalculatorWidgetState extends State<BmiCalculatorWidget> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double weightInput = 0, heightInput = 0;
  String nameInput = '';
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  onSaved: (name) async {
                    nameInput = name!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (weight) async {
                    weightInput = double.parse(weight!);
                  },
                  decoration: InputDecoration(
                    labelText: 'Weight (kg)',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: heightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (height) {
                    heightInput = double.parse(height!);
                  },
                  decoration: InputDecoration(
                    labelText: 'Height (cm)',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    formKey.currentState!.save();
                    double bmi =
                        weightInput / (heightInput / 100 * heightInput / 100);
                    bmi = double.parse(bmi.toStringAsFixed(2));
                    calculateBmiAndSaveData(bmi);
                    String tempUid = ReadUserData().getCurrentUserUid();
                    await UpdateUser().updateBmi(tempUid, bmi);
                    await UpdateUser().updateWeight(tempUid, weightInput);
                    await UpdateUser().updateHeight(tempUid, heightInput);
                    await UpdateUser().updateName(tempUid, nameInput);
                    formKey.currentState!.reset();
                  },
                  child: Text('Calculate BMI'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void calculateBmiAndSaveData(double bmi) {
    // แสดงผลลัพธ์
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('BMI Result'),
          content: Text('Your BMI is: ${bmi.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
