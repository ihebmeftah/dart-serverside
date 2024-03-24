import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';
import 'package:lms_flutter/app/modules/quiz/controllers/quiz_details_controller.dart';

import '../../../component/appelevatedbutton.dart';
import '../../../component/apptextformfield.dart';

class QuizDetailsView extends GetView<QuizDetailsController> {
  const QuizDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title : ",
                    style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                        color: ThemesApp.secondary2),
                  ),
                  Text(
                    controller.quiz.value!.name,
                    style: TextStyle(fontSize: 4.sp),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description : ",
                    style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                        color: ThemesApp.secondary2),
                  ),
                  Text(
                    controller.quiz.value?.desc ?? "-",
                    style: TextStyle(fontSize: 4.sp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: Form(
                      key: controller.form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTextFormField(
                              controller: controller.question,
                              label: "Question",
                              hint: "e.g: what is .... ?"),
                          20.spaceH,
                          AppTextFormField(
                              controller: controller.addInfo,
                              maxLine: 4,
                              label: "Additional Information",
                              hint:
                                  "e.g: you can write information about the correct answer here"),
                          40.spaceH,
                          AppElevatedButton(
                            title: "ADD ",
                            onPressed: controller.createQuestion,
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: GetX<QuizDetailsController>(builder: (_) {
                    return controller.questions.isEmpty
                        ? const Center(
                            child: Text("No Questions"),
                          )
                        : ListView.builder(
                            itemCount: controller.questions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                subtitle: Row(
                                  children: [
                                    Expanded(
                                        child: TextButton(onPressed: () {
                                      Get.bottomSheet(
                                          Container(
                                            padding: EdgeInsets.all(20.h),
                                            height: Get.height / 1.2,
                                            width: Get.width,
                                            child: Form(
                                              key: controller.optionForm,
                                              child: Column(
                                                children: <Widget>[
                                                  AppTextFormField(
                                                    label: 'Option value',
                                                    controller:
                                                        controller.optiontext,
                                                  ),
                                                  20.spaceH,
                                                  GetBuilder<
                                                      QuizDetailsController>(
                                                    id: "option",
                                                    builder: (controller) =>
                                                        SwitchListTile.adaptive(
                                                            title: const Text(
                                                                'Correct'),
                                                            value: controller
                                                                .isCorrect,
                                                            onChanged: controller
                                                                .switchCorrect),
                                                  ),
                                                  AppElevatedButton(
                                                      onPressed: () => controller
                                                          .createOption(
                                                              controller
                                                                  .questions[
                                                                      index]
                                                                  .id!),
                                                      title: ('add')),
                                                  Expanded(child: GetX<
                                                          QuizDetailsController>(
                                                      builder: (context) {
                                                    return controller
                                                            .questions[index]
                                                            .options!
                                                            .isEmpty
                                                        ? const Text(
                                                            'No options')
                                                        : ListView.builder(
                                                            itemCount:
                                                                controller
                                                                    .questions[
                                                                        index]
                                                                    .options
                                                                    ?.length,
                                                            itemBuilder:
                                                                (context, i) =>
                                                                    ListTile(
                                                                      trailing: IconButton(
                                                                          onPressed: () => controller.deleteOption(controller.questions[index].options![i].id!),
                                                                          icon: const Icon(
                                                                            Icons.delete,
                                                                            color:
                                                                                Colors.red,
                                                                          )),
                                                                      subtitle: controller
                                                                              .questions[index]
                                                                              .options![i]
                                                                              .isCorrect
                                                                          ? const Text("Correct options")
                                                                          : null,
                                                                      title: Text(controller
                                                                          .questions[
                                                                              index]
                                                                          .options![
                                                                              i]
                                                                          .text),
                                                                    ));
                                                  }))
                                                ],
                                              ),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white);
                                    }, child: GetX<QuizDetailsController>(
                                            builder: (context) {
                                      return Text(
                                        'Add options (${controller.questions[index].options?.length})',
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      );
                                    }))),
                                    Expanded(
                                        child: TextButton(
                                            onPressed: () => controller
                                                .deleteQuestion(controller
                                                    .questions[index].id!),
                                            child: const Text(
                                              'Delete questions',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ))),
                                  ],
                                ),
                                title: Text(
                                    "Quetions ${index + 1} : ${controller.questions[index].question}"),
                              );
                            });
                  }),
                )
              ]),
            )
          ],
        ),
      ),
      onEmpty: const Center(
        child: Text("This quiz details not found"),
      ),
      onError: (error) => Center(
        child: Text(error.toString()),
      ),
    ));
  }
}
