import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/themes/themes.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({super.key, required this.field, required this.value});
  final String field, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              "${field.capitalizeFirst!} :",
              style: TextStyle(
                  color: ThemesApp.yellow,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            )),
        Expanded(
            child: Text(
          value,
          style: TextStyle(
              color: ThemesApp.secondary2,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
