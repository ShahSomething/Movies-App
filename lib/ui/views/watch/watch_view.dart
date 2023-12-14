import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/views/search/search_view.dart';
import 'package:movies/ui/views/watch/components/all_genres_view.dart';
import 'package:movies/ui/views/watch/components/movie_container/movie_container.dart';
import 'package:movies/ui/views/watch/components/my_app_bar/my_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'watch_viewmodel.dart';

class WatchView extends StackedView<WatchViewModel> {
  const WatchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WatchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: (!viewModel.isTyping && viewModel.showSearchBar)
          ? AllGenresView(
              genres: viewModel.allGenres,
            )
          : viewModel.isTyping
              ? const SearchView()
              : RefreshIndicator(
                  onRefresh: viewModel.refreshMovies,
                  child: PagedListView.separated(
                    pagingController: viewModel.moviesPagingController,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 10.h,
                    ),
                    builderDelegate: PagedChildBuilderDelegate<Movie>(
                      firstPageProgressIndicatorBuilder: (context) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                      itemBuilder: (context, movie, index) {
                        return MovieContainer(
                          movie: movie,
                        );
                      },
                      firstPageErrorIndicatorBuilder: (context) {
                        return Center(
                          child: Text(
                            "Something went wrong",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.blackColor,
                                ),
                          ),
                        );
                      },
                      noItemsFoundIndicatorBuilder: (context) => Center(
                        child: Text(
                          "No upcoming movies",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => 10.verticalSpace,
                  ),
                ),
    );
  }

  @override
  WatchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WatchViewModel();
}
