import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/ui_helpers.dart';
import 'package:movies/ui/views/watch/movie_details/components/my_sliver_appbar.dart';
import 'package:movies/ui/widgets/common/genre_container/genre_container.dart';
import 'package:stacked/stacked.dart';

import 'movie_details_viewmodel.dart';

class MovieDetailsView extends StackedView<MovieDetailsViewModel> {
  const MovieDetailsView(this.movie, {Key? key}) : super(key: key);

  final Movie movie;

  @override
  Widget builder(
    BuildContext context,
    MovieDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            title: child!,
            movie: movie,
            isTrailerLoading: viewModel.isBusy,
            videoId: viewModel.videoId,
          ),
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
                  children: movie.genreIds.map((genreId) {
                    var genre = viewModel.allGenres.firstWhere(
                        (genre) => genre.id == genreId,
                        orElse: () =>
                            Genre(id: 0, name: 'Unknown', color: Colors.red));
                    return GenreContainer(
                      genre: genre,
                    );
                  }).toList(),
                ),
                spacedDivider,
                Text(
                  "Overview",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                20.verticalSpace,
                Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.greyColor,
                      ),
                ),
                20.verticalSpace,
                Text(
                  "Image Gallery",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                if (viewModel.imagesLoading)
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                else if (viewModel.images?.isEmpty == true)
                  const Center(
                    child: Text("No Images Found"),
                  )
              ],
            ),
          ),
          if (viewModel.images != null)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid.builder(
                itemCount: viewModel.images!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              viewModel.images![index]),
                          fit: BoxFit.cover,
                        )),
                  );
                },
              ),
            )
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
      movie.originalTitle,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: AppColors.whiteColor),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }

  @override
  void onViewModelReady(MovieDetailsViewModel viewModel) {
    viewModel.getMovieTrailer(movie.id);
    viewModel.getMovieImages(movie.id);
    super.onViewModelReady(viewModel);
  }
}
