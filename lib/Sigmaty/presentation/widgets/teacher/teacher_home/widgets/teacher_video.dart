import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:video_player/video_player.dart';

class TeacherVideo extends StatefulWidget {
  const TeacherVideo({
    super.key,
    required this.selectedVideo,
    required this.selectedImage,
    required this.sessionName,
    // required this.item,
  });
  // final void Function() onTap;
  final File? selectedVideo;
  final File? selectedImage;
  final String sessionName;
  // final Map<String, dynamic> item;

  @override
  State<TeacherVideo> createState() => _TeacherVideoState();
}

class _TeacherVideoState extends State<TeacherVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.selectedVideo!)
      ..initialize().then((_) {
        setState(() {}); // Refresh UI when video is initialized
      });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _controller.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 200,
                    width: ScreenSize.width(context),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : Container(
                  height: 200, // Placeholder height for the video
                  color: Colors.black12,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          _controller.value.isPlaying
              ? Container()
              : Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(widget.selectedImage!),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
          Positioned(
            bottom: 20,
            child: _controller.value.isPlaying ? Text('') : Text(
              "${widget.sessionName}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 48,
            ),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
          ),
          // Progress Bar
          // Positioned(
          //   bottom: 20,
          //   left: 0,
          //   right: 0,
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //         child: VideoProgressIndicator(
          //           _controller,
          //           allowScrubbing: true,
          //           colors: VideoProgressColors(
          //             backgroundColor: Colors.grey,
          //             bufferedColor: Colors.lightGreen,
          //             playedColor: Colors.greenAccent,
          //           ),
          //         ),
          //       ),
          //       Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //             child: Text(formatDuration(_controller.value.position)),
          //           ),
          //           Expanded(
          //             child: Slider(
          //               min: 0.0,
          //               max: _controller.value.duration.inSeconds.toDouble(),
          //               value: _controller.value.position.inSeconds.toDouble(),
          //               onChanged: (value) {
          //                 setState(() {
          //                   _controller.seekTo(Duration(seconds: value.toInt()));
          //                 });
          //               },
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //             child: Text(formatDuration(_controller.value.duration)),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
    // return Container(
    //   height: ScreenSize.height(context) * 0.2,
    //   width: ScreenSize.width(context),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       gradient: LinearGradient(colors: [
    //         Colors.black.withOpacity(0.25),
    //         const Color(0xff249EF1).withOpacity(0),
    //         const Color(0xff249EF1),
    //       ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    //     ),
    //     child: Stack(
    //       children: [
    //         Icon(
    //           Icons.play_arrow,
    //           color: ColorsAsset.secondaryColor,
    //           size: ScreenSize.width(context) * 0.1,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
