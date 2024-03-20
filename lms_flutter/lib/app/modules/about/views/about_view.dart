import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/themes/themes.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
          backgroundColor: ThemesApp.primary,
          title: const Text('About'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: const Text(
              "Welcome to our quiz app for children! Our app is designed to help children learn and develop their knowledge in a fun and engaging way. We believe that education should be enjoyable, and that's why we created this app.\n\nOur quizzes cover a wide range of topics, from science and math to history and geography. Each quiz is designed to challenge and stimulate children's minds, while also being accessible and easy to understand.\n\nOur team of experts in education and child development has carefully crafted each quiz to ensure that it is both educational and entertaining. We believe that children learn best when they are having fun, and our quizzes are designed to do just that.\n\nAt our core, we believe in the power of education to change lives. We are passionate about helping children learn and grow, and we hope that our app can be a valuable tool for parents, teachers, and children alike.\n\nThank you for choosing our app, and we hope that you enjoy using it to learn and have fun!"),
        ));
  }
}
