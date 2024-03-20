import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';
import 'package:lms_flutter/app/modules/quizhistory/widget/rowtextwidget.dart';

import '../controllers/quizhistory_controller.dart';

class QuizhistoryView extends GetView<QuizhistoryController> {
  const QuizhistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
            backgroundColor: ThemesApp.primary,
            title: const Text('Quiz History'),
            centerTitle: true),
        body: ListView.separated(
          itemCount: 5,
          padding: EdgeInsets.all(20.w),
          separatorBuilder: (context, index) => 10.spaceH,
          itemBuilder: (context, index) => ExpansionTile(
            leading: Image.asset("boarding".toPng),
            title: Text(
              "Category",
              style: TextStyle(
                  color: ThemesApp.secondary1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "World capitals",
              style: TextStyle(
                  color: ThemesApp.secondary2,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
            children: const [
              RowTextWidget(field: "score", value: "11/15"),
              RowTextWidget(field: "Correct answers", value: "11"),
              RowTextWidget(field: "Incorrect answers", value: "4"),
              RowTextWidget(field: "Points earned", value: "75"),
              RowTextWidget(field: "Time", value: "45 seconds"),
            ],
          ),
        ));
  }
}
