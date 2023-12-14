import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerViewModel extends BaseViewModel {
  late YoutubePlayerController youtubePlayerController;

  void init(String videoId) async {
    setBusy(true);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    setBusy(false);
  }

  void onExitFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    onExitFullScreen();
    youtubePlayerController.dispose();
    super.dispose();
  }
}
