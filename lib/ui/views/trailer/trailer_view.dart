import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';

import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'trailer_viewmodel.dart';

class TrailerView extends StackedView<TrailerViewModel> {
  const TrailerView(this.videoId, {Key? key}) : super(key: key);
  final String videoId;

  @override
  Widget builder(
    BuildContext context,
    TrailerViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? const CircularProgressIndicator.adaptive()
        : YoutubePlayerBuilder(
            player: YoutubePlayer(
              width: 1.sw,
              controller: viewModel.youtubePlayerController,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                playedColor: AppColors.skyBlueColor,
                handleColor: AppColors.skyBlueColor,
              ),
              onEnded: (metaData) {
                viewModel.youtubePlayerController.toggleFullScreenMode();
              },
              topActions: [
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    viewModel.onExitFullScreen();
                  },
                  child: const Text("Done"),
                ),
              ],
            ),
            builder: (context, player) {
              return player;
            },
          );
  }

  @override
  TrailerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TrailerViewModel();

  @override
  void onViewModelReady(TrailerViewModel viewModel) {
    viewModel.init(videoId);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    super.onViewModelReady(viewModel);
  }
}
