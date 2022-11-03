import 'package:stock_market/data/utils/exports.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_const.dart';

TextStyle largestTextInter() {
  return GoogleFonts.inter(
    fontSize: 32.0.sp,
    color: ColorConst().white,
    fontWeight: FontWeight.w700,
  );
}

TextStyle largeTextInter() {
  return GoogleFonts.inter(
    fontSize: 25.0.sp,
    color: ColorConst().white,
    fontWeight: FontWeight.w700,
  );
}

TextStyle semiLargeTextInter() {
  return GoogleFonts.inter(
    fontSize: 20.0.sp,
    color: ColorConst().white,
    fontWeight: FontWeight.w600,
  );
}

TextStyle mediumTextInter() {
  return GoogleFonts.inter(
    fontSize: 16.0.sp,
    color: ColorConst().white,
    //fontWeight: FontWeight.w500,
  );
}

TextStyle normalText() {
  return GoogleFonts.inter(
    fontSize: 14.0.sp,
    color: ColorConst().white,
    //fontWeight: FontWeight.w400,
  );
}

TextStyle smallText() {
  return GoogleFonts.inter(
    fontSize: 12.0.sp,
    color: ColorConst().white,
    fontWeight: FontWeight.w300,
  );
}

TextStyle smallestText() {
  return GoogleFonts.inter(
    fontSize: 10.0.sp,
    color: ColorConst().white,
    fontWeight: FontWeight.w200,
  );
}

///GOLDPLAY
///

ThemeData customTheme() {
  final ThemeData themeData = ThemeData();

  //TextTheme _textTheme
  return themeData.copyWith(
    primaryColor: ColorConst().white,
    indicatorColor: ColorConst().white,
    scaffoldBackgroundColor: ColorConst().jetBlack,
    primaryIconTheme: themeData.primaryIconTheme.copyWith(
      color: ColorConst().white,
      size: 20,
    ),
    iconTheme: themeData.iconTheme.copyWith(
      color: ColorConst().jetBlack,
    ),
    //buttonColor: Colors.white,
    backgroundColor: ColorConst().jetBlack,
    tabBarTheme: themeData.tabBarTheme.copyWith(
      labelColor: ColorConst().jetBlack,
      unselectedLabelColor: ColorConst().gunMetalgray,
    ),

    buttonTheme:
        themeData.buttonTheme.copyWith(buttonColor: ColorConst().white),
    //cursorColor: Colors.deepPurple,
    errorColor: Colors.red,
    hintColor: ColorConst().gunMetalgray,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
