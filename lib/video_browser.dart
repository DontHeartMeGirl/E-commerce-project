import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // 视频播放库

class VideoBrowser extends StatefulWidget {
  const VideoBrowser({Key? key}) : super(key: key);

  @override
  _VideoBrowserState createState() => _VideoBrowserState();
}

class _VideoBrowserState extends State<VideoBrowser> {
  final List<String> _videoUrls = [
    'images/111.mp4', // 添加你的视频路径
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical, // 设置为垂直滑动
      itemCount: _videoUrls.length,
      itemBuilder: (context, index) {
        return VideoPlayerScreen(videoUrl: _videoUrls[index]);
      },
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      }).catchError((error) {
        print('Error initializing video: $error');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Video Load Error'),
            content: Text('Failed to load video: $error'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(), // 加载中
      ),
    );
  }
}
