import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/themes/themes.dart';

class AppCard extends StatelessWidget {
  const AppCard(
      {super.key,
      this.ontap,
      required this.child,
      this.color,
      this.shadow = true,
      this.height,
      this.width});
  final Function()? ontap;
  final Widget child;
  final Color? color;
  final double? height, width;
  final bool? shadow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(15.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                boxShadow: shadow == null || shadow == false
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                color: color ?? ThemesApp.primary,
                borderRadius: BorderRadius.circular(15.r)),
            child: child));
  }
}
