import 'package:flutter/material.dart';
import 'package:video/domain/entities/video_post.dart';
import 'package:video/infrastructure/models/local_video_model.dart';
import 'package:video/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  List<VideoPost> videos = [];
  bool initialLoading = true;

  Future<void> loadNextPage() async {
    // TODO : cargar videos

    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((e) => LocalVideoModel.fromJson(e).toVideoEntity())
        .toList();
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
