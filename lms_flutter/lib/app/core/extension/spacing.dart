import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacing on num {
  SizedBox get spaceH => SizedBox(height: toDouble().h);
  SizedBox get spaceW => SizedBox(width: toDouble().w);
}