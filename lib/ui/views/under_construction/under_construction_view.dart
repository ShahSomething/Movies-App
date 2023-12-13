import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import 'under_construction_viewmodel.dart';

class UnderConstructionView extends StackedView<UnderConstructionViewModel> {
  const UnderConstructionView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UnderConstructionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          'assets/Under Construction.json',
        ),
      ),
    );
  }

  @override
  UnderConstructionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UnderConstructionViewModel();
}
