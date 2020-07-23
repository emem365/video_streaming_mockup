import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  bool isShowingControls;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://emem365.github.io/host_repo/videoplayback.mp4");
    _initializeVideoPlayerFuture =
        _controller.initialize().then((value) => _controller.play());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 150),
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // _controller.play();
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: <Widget>[
                  VideoPlayer(_controller),
                  Center(
                    child: InkWell(
                      onTap: () => setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                        }
                      }),
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            );
          } else
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "https://s2.dmcdn.net/v/HvVBH1O3T82ECA5Uk/x1080",
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            );
        },
      ),
    );
  }
}