import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.grey.shade100,
          child: Image.asset('facebook'.toPng),
        ),
        20.spaceW,
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.grey.shade100,
          child: Image.asset('google'.toPng),
        ),
        !GetPlatform.isIOS
            ? const SizedBox()
            : Row(
                children: [
                  20.spaceW,
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.grey.shade100,
                    child: Image.asset('apple'.toPng),
                  ),
                ],
              )
      ],
    );
  }
}
