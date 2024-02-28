// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

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
//               "รายละเอียดท่า", // เปลี่ยนข้อความที่ต้องการแสดง
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
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class InfoPosture extends StatefulWidget {
  final String videoPath;
  final String detailText;

  const InfoPosture(
      {Key? key, required this.videoPath, required this.detailText})
      : super(key: key);

  @override
  _InfoPostureState createState() => _InfoPostureState();
}

class _InfoPostureState extends State<InfoPosture> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9, // สัดส่วนของวิดีโอ
      autoPlay: false, // ไม่ต้องเล่นอัตโนมัติเมื่อโหลด
      looping: false, // ไม่เล่นวนรอบ
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double clipHeight = screenHeight / 4;

    return MaterialApp(
      title: 'Video',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercise'),
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
            SizedBox(
              height: clipHeight,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
            Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
            Text(
              widget.detailText, // ใส่ข้อความที่ถูกส่งมาจากหน้า ArmScreen
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
