import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/ui_helpers.dart';
import 'package:movies/ui/views/watch/movie_details/components/my_sliver_appbar.dart';
import 'package:movies/ui/widgets/common/genre_container/genre_container.dart';
import 'package:stacked/stacked.dart';

import 'movie_details_viewmodel.dart';

class MovieDetailsView extends StackedView<MovieDetailsViewModel> {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MovieDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(child: child!),
          SliverPadding(
            padding: EdgeInsets.all(20.sp),
            sliver: SliverList.list(
              children: [
                Text(
                  "Genres",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                20.verticalSpace,
                Wrap(
                  runSpacing: 7.h,
                  spacing: 7.w,
                  children: const [
                    GenreContainer(
                      color: AppColors.lightGreenColor,
                      genre: "Action",
                    ),
                    GenreContainer(
                      color: AppColors.pinkColor,
                      genre: "Thriller",
                    ),
                    GenreContainer(
                      color: AppColors.purpleColor,
                      genre: "Science",
                    ),
                    GenreContainer(
                      color: AppColors.darkYellowColor,
                      genre: "Fiction",
                    ),
                  ],
                ),
                spacedDivider,
                Text(
                  "Overview",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                20.verticalSpace,
                Text(
                  "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons." *
                      4,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.greyColor,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  MovieDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MovieDetailsViewModel();

  @override
  Widget? staticChildBuilder(BuildContext context) {
    return AutoSizeText(
      "Movie Name",
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: AppColors.whiteColor),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
