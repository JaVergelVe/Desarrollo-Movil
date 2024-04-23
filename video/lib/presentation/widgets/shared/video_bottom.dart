import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:video/config/helpers/format_number.dart';
import 'package:video/domain/entities/video_post.dart';

class VideoButton extends StatelessWidget {
  final VideoPost video;

  const VideoButton({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconColor: Colors.red,
          iconData: Icons.favorite,
        ),
        const SizedBox(
          height: 5,
        ),
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.visibility,
        ),
        const SizedBox(
          height: 5,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const _CustomIconButton(
            value: 0,
            iconColor: Colors.red,
            iconData: Icons.play_circle_outline,
          ),
        )
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;
  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
            )),
        if (value > 0) Text(FormatNumber.converNumber(value.toDouble()))
      ],
    );
  }
}
