import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'genre_image_container_model.dart';

class GenreImageContainer extends StackedView<GenreImageContainerModel> {
  const GenreImageContainer(
      {this.height = 100,
      this.width = double.infinity,
      required this.genre,
      super.key});
  final double height;
  final double width;
  final Genre genre;

  @override
  Widget builder(
    BuildContext context,
    GenreImageContainerModel viewModel,
    Widget? child,
  ) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: Container(
            height: (height / 2) - 20,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.blackColor,
                  AppColors.blackColor.withOpacity(0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                genre.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
            ),
          ),
          child: SizedBox(
            height: height,
            child: (viewModel.isBusy || viewModel.genreImageUrl == null)
                ? const Center(child: CircularProgressIndicator.adaptive())
                : CachedNetworkImage(
                    imageUrl: viewModel.genreImageUrl!,
                    height: height,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }

  @override
  GenreImageContainerModel viewModelBuilder(
    BuildContext context,
  ) =>
      GenreImageContainerModel();

  @override
  void onViewModelReady(GenreImageContainerModel viewModel) {
    viewModel.fetchGenreImage(genre);
    super.onViewModelReady(viewModel);
  }
}
