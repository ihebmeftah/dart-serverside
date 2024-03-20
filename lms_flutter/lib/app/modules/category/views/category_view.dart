import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/component/appcard.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';

import '../../../component/appcategorywidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
            10.spaceW,
          ],
        ),
        body: SafeArea(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.w,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) => AppCard(
                ontap: () => Get.toNamed(Routes.QUIZES_CAT),
                child: AppCategroyWidget(
                  img: "boarding".toPng,
                  title: "Category",
                  subtitle: "1$index Quizzes",
                )),
          ),
        ));
  }
}
