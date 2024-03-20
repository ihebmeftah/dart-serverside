import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/themes/themes.dart';

class StatsItemWidget extends StatelessWidget {
  const StatsItemWidget(
      {super.key,
      required this.imgpath,
      required this.name,
      required this.value});
  final String imgpath, name, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          imgpath,
          width: 30.w,
          height: 30.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name.capitalizeFirst!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: ThemesApp.secondary1,
                ),
              ),
              Text(
                value.capitalizeFirst!,
                style: TextStyle(
                    color: ThemesApp.secondary2,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
