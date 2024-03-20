import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemesApp {
  //Colors
  static final HexColor primary = HexColor("ECE1CF");
  static final HexColor secondary1 = HexColor("663A3B");
  static final HexColor secondary2 = HexColor("3B7269");
  static final HexColor lightYellow = HexColor("FCE5B6");
  static final HexColor yellow = HexColor("F8B734");
  static final HexColor white = HexColor("F4FAFE");
  static final HexColor greyLight = HexColor("969696");
  static final HexColor geryAcc = HexColor("848484");
  static final HexColor greyBlack = HexColor("424242");
  static final HexColor black = HexColor("000000");
  static final light = ThemeData(
      fontFamily: 'Mali',
      useMaterial3: true,
      colorSchemeSeed: primary,
      listTileTheme: ListTileThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        tilePadding: EdgeInsets.all(10.h),
        childrenPadding: EdgeInsets.all(10.w),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: ThemesApp.greyLight,
        selectedItemColor: ThemesApp.secondary2,
        showUnselectedLabels: true,
        elevation: 10,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w700, color: secondary1, fontSize: 16.sp)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: greyLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: secondary2,
              fixedSize: Size(300.w, 46.h))));
}
