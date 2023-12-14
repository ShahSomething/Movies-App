import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.router.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/my_utils.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer(
      {super.key, this.height = 180, this.width = double.infinity});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          locator<NavigationService>().navigateToMovieDetailsView();
        },
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
                  "The King's Man",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: MyUtils.getTempLink(
                height: height.toInt(),
                width: 1.sw.toInt(),
              ),
              fit: BoxFit.cover,
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
}
