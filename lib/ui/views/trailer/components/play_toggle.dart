import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class LandscapePlayToggle extends StatelessWidget {
  const LandscapePlayToggle({Key? key, required this.flickManager})
      : super(key: key);

  final FlickManager flickManager;

  @override
  Widget build(BuildContext context) {
    FlickControlManager controlManager = flickManager.flickControlManager ??
        FlickControlManager(flickManager: flickManager);
    FlickVideoManager videoManager = flickManager.flickVideoManager!;

    double size = 50;
    Color color = Colors.white;

    Widget playWidget = Icon(
      Icons.play_arrow,
      size: size,
      color: color,
    );
    Widget pauseWidget = Icon(
      Icons.pause,
      size: size,
      color: color,
    );
    Widget replayWidget = Icon(
      Icons.replay,
      size: size,
      color: color,
    );

    Widget child = videoManager.isVideoEnded
        ? replayWidget
        : videoManager.isPlaying
            ? pauseWidget
            : playWidget;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: const Color.fromRGBO(108, 165, 242, 0.5),
        key: key,
        onTap: () {
          videoManager.isVideoEnded
              ? controlManager.replay()
              : controlManager.togglePlay();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(10),
          child: child,
        ),
      ),
    );
  }
}