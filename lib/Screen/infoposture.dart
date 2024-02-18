import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class InfoPosture extends StatefulWidget {
  const InfoPosture({Key? key}) : super(key: key);

  @override
  _InfoPostureState createState() => _InfoPostureState();
}

class _InfoPostureState extends State<InfoPosture> {
  late VideoPlayerController _controller;
  late Timer timer;
  int selectedTime = 1;
  int countdown = 0;
  bool isCounting = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    // Set up the timer to update countdown
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (isCounting && countdown > 0) {
        setState(() {
          countdown--;
        });
      } else if (countdown == 0) {
        t.cancel();
        isCounting = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  void startCountdown() {
    if (!isCounting) {
      setState(() {
        isCounting = true;
        countdown = selectedTime * 90; // 1 นาที 30 วินาที
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double clipHeight = screenHeight / 4;

    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ท่า 1'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            SizedBox(
              height: clipHeight,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                    startCountdown();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
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
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startCountdown();
              },
              child: Text("เริ่มนับถอยหลัง"),
            ),
            Text(
              "ข้อความของคุณ",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:async';

// /// Stateful widget to fetch and then display video content.
// class InfoPosture extends StatefulWidget {
//   const InfoPosture({super.key});

//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<InfoPosture> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double clipHeight = screenHeight / 4;

//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ท่า 1'),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Text at the top
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//             ),
//             // Video in the middle
//             SizedBox(
//               height: clipHeight,
//               child: _controller.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: _controller.value.aspectRatio,
//                       child: VideoPlayer(_controller),
//                     )
//                   : Container(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: FloatingActionButton(
//                 onPressed: () {
//                   setState(() {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();
//                   });
//                 },
//                 child: Icon(
//                   _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                 ),
//               ),
//             ),
//             Text(
//               "ข้อความของคุณ", // เปลี่ยนข้อความที่ต้องการแสดง
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.black,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
