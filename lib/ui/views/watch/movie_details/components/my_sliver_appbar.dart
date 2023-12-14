import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.router.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/app_strings.dart';
import 'package:movies/ui/widgets/common/invisible%20header/invisible_header.dart';
import 'package:stacked_services/stacked_services.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar(
      {super.key,
      required this.title,
      required this.movie,
      this.trailerUrl,
      required this.isTrailerLoading});

  final Widget title;
  final Movie movie;
  final String? trailerUrl;
  final bool isTrailerLoading;

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('MMMM dd, yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = movie.backdropPath ?? movie.posterPath;
    String imageUrl = imagesBaseUrl + imagePath;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.primaryColor,
      title: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.whiteColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      actions: [
        InvisibleExpandedHeader(
          minHeight: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.book_online_rounded,
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                ),
                onPressed: trailerUrl != null
                    ? () {
                        locator<NavigationService>().navigateToTrailerView(
                          trailerUrl: trailerUrl!,
                        );
                      }
                    : null,
                icon: isTrailerLoading
                    ? const CircularProgressIndicator.adaptive()
                    : Icon(
                        trailerUrl != null
                            ? Icons.play_arrow_rounded
                            : Icons.warning_amber_rounded,
                      ),
              ),
              10.horizontalSpace,
            ],
          ),
        ),
      ],
      expandedHeight: 0.5.sh,
      floating: false,
      pinned: true,
      titleSpacing: 0,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        title: InvisibleExpandedHeader(
          minHeight: 170,
          replacement: Padding(
            padding: EdgeInsets.all(40.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: title,
                ),
                Text(
                  "In Theaters ${formatDate(movie.releaseDate)}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.whiteColor),
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get Tickets"),
                ),
                10.verticalSpace,
                OutlinedButton.icon(
                  onPressed: trailerUrl != null
                      ? () {
                          locator<NavigationService>().navigateToTrailerView(
                            trailerUrl: trailerUrl!,
                          );
                        }
                      : null,
                  icon: isTrailerLoading
                      ? const CircularProgressIndicator.adaptive()
                      : Icon(trailerUrl != null
                          ? Icons.play_arrow_rounded
                          : Icons.warning_amber_rounded),
                  label: Text(isTrailerLoading
                      ? "Loading..."
                      : trailerUrl != null
                          ? "Watch Trailer"
                          : "Trailer not found"),
                )
              ],
            ),
          ),
          child: title,
        ),
        centerTitle: true,
        background: GridTile(
          footer: Container(
            width: double.infinity,
            height: 350.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.blackColor,
                  Colors.black.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          child: Hero(
            tag: imagePath,
            transitionOnUserGestures: true,
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return CircularProgressIndicator.adaptive(
                  value: progress.progress,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
