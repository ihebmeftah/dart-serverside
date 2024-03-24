import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/app/component/appdropdown.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/modules/category/controllers/category_controller.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';

import '../../../component/appelevatedbutton.dart';
import '../../../component/apptextformfield.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Form(
                  key: controller.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetX<CategoryController>(builder: (_) {
                        return AppDropdown<Category>(
                          label: "Categroy",
                          hint: "e.g: Sport",
                          onChange: controller.selectCategory,
                          items: _.categories
                              .map((element) => DropdownMenuItem(
                                  value: element, child: Text(element.name)))
                              .toList(),
                        );
                      }),
                      20.spaceH,
                      AppTextFormField(
                          controller: controller.quizName,
                          label: "Quiz name",
                          hint: "e.g: Football"),
                      20.spaceH,
                      AppTextFormField(
                          controller: controller.quizDesc,
                          maxLine: 4,
                          label: "Category description",
                          hint: "e.g: Football quiz in sport category"),
                      40.spaceH,
                      AppElevatedButton(
                        title: "ADD ",
                        onPressed: controller.createQuiz,
                      )
                    ],
                  )),
            ),
          ),
          Expanded(
            child: controller.obx(
              (state) => ListView.builder(
                  itemCount: controller.quizes.length,
                  itemBuilder: (context, index) => ListTile(
                        onTap: () => Get.toNamed(
                          "${Routes.QUIZ}/${controller.quizes[index].id}",
                        ),
                        title: Text(
                          controller.quizes[index].name,
                        ),
                        subtitle: Text(
                          controller.quizes[index].desc ?? "--",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          onPressed: () => controller.deleteQuiz(
                            controller.quizes[index].id!,
                          ),
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      )),
              onEmpty: const Center(child: Text("No quizes found")),
              onError: (error) => Text(
                error.toString(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
