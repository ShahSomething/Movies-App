import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/ui/views/trailer/components/landscape_controls.dart';
import 'package:stacked/stacked.dart';

import 'trailer_viewmodel.dart';

class TrailerView extends StackedView<TrailerViewModel> {
  const TrailerView(this.trailerUrl, {Key? key}) : super(key: key);
  final String trailerUrl;

  @override
  Widget builder(
    BuildContext context,
    TrailerViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? const CircularProgressIndicator.adaptive()
        : FlickVideoPlayer(
            flickManager: viewModel.flickManager,
            preferredDeviceOrientation: const [
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft
            ],
            systemUIOverlay: const [],
            flickVideoWithControls: FlickVideoWithControls(
              controls: LandscapePlayerControls(
                flickManager: viewModel.flickManager,
              ),
            ),
          );
  }

  @override
  TrailerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TrailerViewModel();

  @override
  void onViewModelReady(TrailerViewModel viewModel) {
    viewModel.init(trailerUrl);
    super.onViewModelReady(viewModel);
  }
}
