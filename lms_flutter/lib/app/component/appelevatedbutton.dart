import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key, this.onPressed, required this.title});
  final Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: GetPlatform.isWeb ? 100.w : Get.width,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
                fontSize: GetPlatform.isWeb ? 4.sp : 18.sp,
                color: Colors.white),
          )),
    );
  }
}
