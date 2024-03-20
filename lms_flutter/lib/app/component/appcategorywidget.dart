import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';

import '../core/themes/themes.dart';

class AppCategroyWidget extends StatelessWidget {
  const AppCategroyWidget(
      {super.key, this.img, required this.title, this.subtitle});
  final String? img, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(img!),
        ),
        5.spaceH,
        Text(
          title!.capitalizeFirst!,
          style: TextStyle(
              color: ThemesApp.secondary1,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
        subtitle == null
            ? const SizedBox()
            : Text(
                subtitle!.capitalizeFirst!,
                style: TextStyle(
                    color: ThemesApp.secondary2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              )
      ],
    );
  }
}
