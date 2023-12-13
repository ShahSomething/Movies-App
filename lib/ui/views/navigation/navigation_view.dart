import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:movies/ui/common/app_icons.dart';
import 'package:movies/ui/views/watch/watch_view.dart';
import 'package:stacked/stacked.dart';

import 'navigation_viewmodel.dart';

class NavigationView extends StackedView<NavigationViewModel> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NavigationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: getViewForIndex(viewModel.currentIndex),
      ),
      extendBody: false,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: AppColors.primaryColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(27),
          child: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
            selectedFontSize: 10.sp,
            unselectedFontSize: 10.sp,
            items: [
              _bottomNavItem(
                iconPath: AppIcons.dashboardIcon,
                label: "Dashboard",
              ),
              _bottomNavItem(
                iconPath: AppIcons.watchIcon,
                label: "Watch",
              ),
              _bottomNavItem(
                iconPath: AppIcons.libraryIcon,
                label: "Media Library",
              ),
              _bottomNavItem(
                iconPath: AppIcons.moreIcon,
                label: "More",
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem(
      {required String iconPath, required String label}) {
    getIcon({isActive = false}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          iconPath,
          height: 18.h,
          width: 18.w,
          colorFilter: ColorFilter.mode(
            isActive ? AppColors.whiteColor : AppColors.greyColor,
            BlendMode.srcIn,
          ),
        ),
      );
    }

    return BottomNavigationBarItem(
      icon: getIcon(),
      activeIcon: getIcon(isActive: true),
      label: label,
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return Container();
      case 1:
        return const WatchView();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return const WatchView();
    }
  }

  @override
  NavigationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NavigationViewModel();
}
