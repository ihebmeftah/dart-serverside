import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';

class HelpItemWidget extends StatelessWidget {
  const HelpItemWidget({super.key, required this.label, required this.text});
  final String label, text;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "$label : ",
        children: <TextSpan>[
          TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ThemesApp.black,
              )),
        ],
      ),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: ThemesApp.yellow,
        fontSize: 16.sp,
      ),
    );
  }
}
