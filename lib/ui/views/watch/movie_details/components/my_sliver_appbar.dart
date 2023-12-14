import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/my_utils.dart';
import 'package:movies/ui/widgets/common/invisible%20header/invisible_header.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_rounded,
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
                  child: child,
                ),
                Text(
                  "In Theaters December 22,2021",
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
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text("Watch Trailer"),
                )
              ],
            ),
          ),
          child: child,
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
            tag: "test",
            transitionOnUserGestures: true,
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: MyUtils.getTempLink(
                  width: 1.sw.toInt(), height: 0.5.sh.toInt()),
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
