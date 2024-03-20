import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';

import '../controllers/quiz_play_controller.dart';

class QuizPlayView extends GetView<QuizPlayController> {
  const QuizPlayView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemesApp.primary,
      appBar: AppBar(
          backgroundColor: ThemesApp.primary,
          title: const Text('Category name')),
      body: Column(
        children: [
          Container(
            width: 160.w,
            alignment: Alignment.center,
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ThemesApp.yellow),
            child: Text(
              "Questions 1/10",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          20.spaceH,
          Expanded(
            child: PageView.builder(
              itemCount: 10,
              controller: controller.pageController,
              pageSnapping: false,
              padEnds: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  children: [
                    Container(
                      height: 160.h,
                      color: Colors.grey.shade100,
                    ),
                    20.spaceH,
                    Text("Where is the largest volcano on earth located ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: ThemesApp.secondary1)),
                    20.spaceH,
                    ...List.generate(
                        4,
                        (index) => Card(
                              elevation: 5,
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              child: GetBuilder<QuizPlayController>(
                                  id: index,
                                  builder: (_) {
                                    log("Rebuild all listtile");
                                    return ListTile(
                                      onTap: () {
                                        controller.onSelectedAnswer(index);
                                      },
                                      tileColor: Colors.white,
                                      trailing: GetBuilder<QuizPlayController>(
                                          id: index,
                                          builder: (_) {
                                            log("selection $index");
                                            return controller.selectedAnswer ==
                                                    index
                                                ? const Icon(Icons.done)
                                                : const SizedBox();
                                          }),
                                      selected:
                                          controller.selectedAnswer == index,
                                      selectedColor: Colors.white,
                                      selectedTileColor: controller.isCorrect ==
                                                  false &&
                                              controller.selectedAnswer != null
                                          ? Colors.red
                                          : controller.isCorrect == true &&
                                                  controller.selectedAnswer !=
                                                      null
                                              ? Colors.green
                                              : ThemesApp.secondary2,
                                      title: Text(
                                        "Choice ${index + 1}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  }),
                            ))
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
