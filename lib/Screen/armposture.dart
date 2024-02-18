import 'dart:async';

import 'package:flutter/material.dart';

class ArmPosture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCountdownWidget(),
    );
  }
}

class MyCountdownWidget extends StatefulWidget {
  @override
  _MyCountdownWidgetState createState() => _MyCountdownWidgetState();
}

class _MyCountdownWidgetState extends State<MyCountdownWidget> {
  int selectedTime = 1; // จำนวนนับถอยหลังที่เลือก
  int countdown = 0; // จำนวนวินาทีที่ต้องการนับถอยหลัง
  late Timer timer;
  bool isCounting = false;

  @override
  void initState() {
    super.initState();
    updateCountdown();
  }

  void updateCountdown() {
    countdown = selectedTime * 90; // 1 นาที 30 วินาที
  }

  void startCountdown() {
    if (!isCounting && countdown > 0) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        setState(() {
          if (countdown == 0) {
            t.cancel();
            isCounting = false;
          } else {
            countdown--;
          }
        });
      });

      isCounting = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countdown Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${(countdown ~/ 60).toString().padLeft(2, '0')}:${(countdown % 60).toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            DropdownButton<int>(
              value: selectedTime,
              items: List.generate(4, (index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text('${index + 1}'),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedTime = value!;
                  updateCountdown();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startCountdown,
              child: Text("เริ่มนับถอยหลัง"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
