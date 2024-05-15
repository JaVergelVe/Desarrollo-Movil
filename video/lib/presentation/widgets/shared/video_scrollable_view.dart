import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video/domain/entities/video_post.dart';
import 'package:video/presentation/widgets/shared/video_bottom.dart';
import 'package:video/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: videos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final VideoPost videoPost = videos[index];
          return Stack(
            children: [
              SizedBox.expand(
                child: FullScreenPlayer(
                  videUrl: videoPost.videoUrl,
                  caption: videoPost.caption,
                ),
              ),
              Positioned(
                bottom: 40,
                right: 20,
                child: VideoButton(video: videoPost),
              )
            ],
          );
        });
  }
}
