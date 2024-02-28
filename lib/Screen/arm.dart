// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Screen/armposture.dart';
// import 'package:flutter_application_1/Screen/infoposture.dart';
// import 'package:flutter_application_1/controller/auth.dart';
// import 'package:flutter_application_1/controller/read.dart';
// import 'package:flutter_application_1/controller/update.dart';

// class ArmScreen extends StatelessWidget {
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('แขน'),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.red, // สีพื้นหลัง
//                       minimumSize: Size(1500, 80), // ขนาดปุ่ม
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0), // มุมโค้งมน
//                       ),
//                     ),
//                     child: Text("ท่า1",
//                         style: TextStyle(fontSize: 20, color: Colors.black)),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => InfoPosture()),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                       top: 10.0), // Set the desired spacing here
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red, // สีพื้นหลัง
//                         minimumSize: Size(1500, 80), // ขนาดปุ่ม
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(10.0), // มุมโค้งมน
//                         ),
//                       ),
//                       child: Text("ท่า2",
//                           style: TextStyle(fontSize: 20, color: Colors.black)),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => ArmPosture()),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                       top: 10.0), // Set the desired spacing here
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red, // สีพื้นหลัง
//                         minimumSize: Size(1500, 80), // ขนาดปุ่ม
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(10.0), // มุมโค้งมน
//                         ),
//                       ),
//                       child: Text("ท่า3",
//                           style: TextStyle(fontSize: 20, color: Colors.black)),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => ArmPosture()),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                       top: 10.0), // Set the desired spacing here
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red, // สีพื้นหลัง
//                         minimumSize: Size(1500, 80), // ขนาดปุ่ม
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(10.0), // มุมโค้งมน
//                         ),
//                       ),
//                       child: Text("ท่า4",
//                           style: TextStyle(fontSize: 20, color: Colors.black)),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => ArmPosture()),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                       top: 10.0), // Set the desired spacing here
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red, // สีพื้นหลัง
//                         minimumSize: Size(1500, 80), // ขนาดปุ่ม
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(10.0), // มุมโค้งมน
//                         ),
//                       ),
//                       child: Text("ท่า5",
//                           style: TextStyle(fontSize: 20, color: Colors.black)),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => ArmPosture()),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Screen/infoposture.dart';

class ArmScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('แขน'),
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
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(1500, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text(
                        "Dumbbell Biceps Curl",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                          context,
                          'assets/video/Dumbbell_Biceps_Curl.mp4',
                          'ท่าเล่นแขน ดัมเบล Dumbbell Bicep Curl ที่ช่วยเสริมส่วนกล้ามหน้าแขน เก็บศอกให้ชิดข้างลำตัว ไม่แกว่งเวลาผ่อนและออกแรง จะทำให้โดนกล้ามเนื้อหน้าแขนมากขึ้น',
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(1500, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text(
                        "Dumbbell Hammer Curl",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                          context,
                          'assets/video/Dumbbell_hammer_Curl.mp4',
                          'จัดตำแหน่งดัมเบลทั้งสองไว้ข้างตัว หันฝ่ามือทั้งสองข้างเข้าด้านใน แขนทั้งสองข้างอยู่ในลักษณะตรงจัดข้อศอกให้อยู่ด้านข้างลำตัว ยกดัมเบลด้านหนึ่งจนกระทั่งปลายแขนเป็นแนวตั้ง และนิ้วหัวแม่มืออยู่หน้าไหล่ และลดระดับไปที่ตำแหน่งเดิม และทำซ้ำ ',
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
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
