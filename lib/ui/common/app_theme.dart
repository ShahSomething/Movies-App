import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/common/app_colors.dart';

class AppTheme {
  // Define default light and dark color themes
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    primaryColor: AppColors.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(
      background: AppColors.backgoundColor,
      brightness: Brightness.light,
      error: AppColors.errorColor,
      errorContainer: AppColors.errorColor,
      primary: AppColors.primaryColor,
      //secondary: AppColors.secondaryColor,
    ),
    scaffoldBackgroundColor: AppColors.backgoundColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.greyColor,
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.skyBlueColor,
        disabledBackgroundColor: AppColors.greyColor,
        foregroundColor: AppColors.whiteColor,
        disabledForegroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
        textStyle: GoogleFonts.poppins(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w800,
          fontSize: 32,
        ),
        displayMedium: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
        displaySmall: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        headlineLarge: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        bodyMedium: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryColor),
      checkColor: MaterialStateProperty.all(AppColors.whiteColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        disabledBackgroundColor: AppColors.greyColor,
        foregroundColor: AppColors.whiteColor,
        disabledForegroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
        side: const BorderSide(
          color: AppColors.skyBlueColor,
          width: 1,
        ),
        textStyle: GoogleFonts.poppins(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.lightGreyColor,
        foregroundColor: AppColors.blackColor,
        alignment: Alignment.center,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightGreyColor,
      showCheckmark: false,
      side: BorderSide.none,
      disabledColor: AppColors.greyColor,
      labelStyle: GoogleFonts.poppins(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      selectedColor: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.greyColor,
      showUnselectedLabels: true,
      selectedLabelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    useMaterial3: true,
  );

  // static final ThemeData darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   splashColor: Colors.transparent,
  //   primaryColor: AppColors.primaryColor,
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     backgroundColor: AppColors.cardColorDark.withOpacity(0.7),
  //   ),
  //   bottomAppBarTheme: BottomAppBarTheme(
  //     color: AppColors.cardColorDark.withOpacity(0.7),
  //     shadowColor: AppColors.blackColor,
  //     elevation: 0,
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 16.sp,
  //     ),
  //   ),
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   colorScheme: const ColorScheme.dark(
  //     background: AppColors.backgoundColorDark,
  //     brightness: Brightness.dark,
  //     error: AppColors.errorColor,
  //     errorContainer: AppColors.errorColor,
  //     primary: AppColors.primaryColor,
  //     //secondary: AppColors.secondaryColor,
  //   ),
  //   scaffoldBackgroundColor: AppColors.backgoundColorDark,
  //   textTheme: GoogleFonts.poppinsTextTheme(
  //     TextTheme(
  //       headlineLarge: TextStyle(
  //         fontSize: 24.sp,
  //         fontWeight: FontWeight.w700,
  //         height: 1.5,
  //       ),
  //       headlineMedium: TextStyle(
  //         fontSize: 20.sp,
  //         fontWeight: FontWeight.w700,
  //         height: 1.5,
  //       ),
  //       headlineSmall: TextStyle(
  //         fontSize: 16.sp,
  //         fontWeight: FontWeight.w700,
  //         height: 1.5,
  //       ),
  //       displayLarge: TextStyle(
  //         fontSize: 24.sp,
  //         fontWeight: FontWeight.w500,
  //         height: 1.5,
  //       ),
  //       displayMedium: TextStyle(
  //         fontSize: 20.sp,
  //         fontWeight: FontWeight.w500,
  //         height: 1.5,
  //       ),
  //       displaySmall: TextStyle(
  //         fontSize: 16.sp,
  //         fontWeight: FontWeight.w500,
  //         height: 1.5,
  //       ),
  //       bodyLarge: TextStyle(
  //         fontSize: 24.sp,
  //         fontWeight: FontWeight.w400,
  //         height: 1.5,
  //       ),
  //       bodyMedium: TextStyle(
  //         fontSize: 20.sp,
  //         fontWeight: FontWeight.w400,
  //         height: 1.5,
  //       ),
  //       bodySmall: TextStyle(
  //         fontSize: 16.sp,
  //         fontWeight: FontWeight.w400,
  //         height: 1.5,
  //       ),
  //       titleLarge: TextStyle(
  //         fontSize: 14.sp,
  //         fontWeight: FontWeight.w700,
  //         height: 1.5,
  //       ),
  //       titleMedium: TextStyle(
  //         fontSize: 12.sp,
  //         fontWeight: FontWeight.w700,
  //         height: 1.5,
  //       ),
  //       titleSmall: TextStyle(
  //         fontSize: 10.sp,
  //         fontWeight: FontWeight.w700,
  //         height: 1.5,
  //       ),
  //       labelLarge: TextStyle(
  //         fontSize: 14.sp,
  //         fontWeight: FontWeight.w500,
  //         height: 1.5,
  //       ),
  //       labelMedium: TextStyle(
  //         fontSize: 12.sp,
  //         fontWeight: FontWeight.w500,
  //         height: 1.5,
  //       ),
  //       labelSmall: TextStyle(
  //         fontSize: 10.sp,
  //         fontWeight: FontWeight.w500,
  //         height: 1.5,
  //       ),
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: AppColors.primaryColor,
  //       foregroundColor: Colors.black,
  //       disabledBackgroundColor: AppColors.greyColor,
  //       disabledForegroundColor: Colors.white,
  //       // shadowColor: AppColors.primaryColor,
  //       padding: EdgeInsets.symmetric(
  //         vertical: 16.h,
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16.r),
  //       ),
  //       elevation: 0,
  //       textStyle: GoogleFonts.poppins(
  //         fontWeight: FontWeight.w400,
  //         fontSize: 14.sp,
  //       ),
  //     ),
  //   ),
  //   outlinedButtonTheme: OutlinedButtonThemeData(
  //     style: OutlinedButton.styleFrom(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16.r),
  //       ),
  //       padding: EdgeInsets.all(16.sp),
  //       side: const BorderSide(
  //         color: AppColors.lightGreyColorD,
  //       ),
  //       foregroundColor: AppColors.lightGreyColorD,
  //       backgroundColor: Colors.transparent,
  //       disabledBackgroundColor: AppColors.greyColor,
  //       disabledForegroundColor: Colors.white,
  //       elevation: 0,
  //       textStyle: GoogleFonts.poppins(
  //         fontWeight: FontWeight.w400,
  //         fontSize: 14.sp,
  //       ),
  //     ),
  //   ),
  //   chipTheme: ChipThemeData(
  //     showCheckmark: false,
  //     side: BorderSide.none,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(16.r),
  //     ),
  //     selectedColor: AppColors.primaryColor,
  //     disabledColor: AppColors.greyColor,
  //   ),
  //   sliderTheme: SliderThemeData(
  //     activeTrackColor: AppColors.whiteColor,
  //     inactiveTrackColor: AppColors.lightGreyColorD.withOpacity(0.5),
  //     trackHeight: 1.h,
  //     thumbShape: SliderComponentShape.noOverlay,
  //     overlayShape: SliderComponentShape.noOverlay,
  //   ),
  //   useMaterial3: true,
  // );

  //Toggle between light and dark theme
  // static ThemeData getTheme(BuildContext context) {
  //   if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
  //     return darkTheme;
  //   } else {
  //     return lightTheme;
  //   }
  // }
}
