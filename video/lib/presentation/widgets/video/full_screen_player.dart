import 'package:flutter/material.dart';
import 'package:video/presentation/widgets/video/background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    // print(widget.videUrl);
    /* controller = VideoPlayerController.asset(widget.videUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play(); */
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videUrl))
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            (controller.value.isPlaying)
                ? controller.pause()
                : controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(controller),
              Background(),
              Positioned(
                bottom: 50,
                left: 20,
                child: Text(
                  widget.caption,
                  maxLines: 2,
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
