import 'package:video/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel(
      {required this.name,
      required this.caption,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json["name"] ?? 'No video',
        caption: json["name"] ?? 'no video',
        videoUrl: json["videoUrl"] ?? '',
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
      );

  VideoPost toVideoEntity() => VideoPost(
        name: name,
        caption: caption,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
      );
}
