import 'package:flutter/services.dart';
import 'package:movies/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

class TrailerViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  late FlickManager flickManager;

  void init(String trailerUrl) {
    setBusy(true);
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(trailerUrl),
      ),
    );
    setBusy(false);
    flickManager.onVideoEnd = () {
      _navigationService.back();
    };
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    flickManager.dispose();
    super.dispose();
  }
}
