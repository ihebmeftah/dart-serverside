import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/modules/help/widgets/helpitemwidget.dart';

import '../../../core/themes/themes.dart';
import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
          title: const Text('Help'),
          backgroundColor: ThemesApp.primary,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const HelpItemWidget(
                  label: "Tutorials",
                  text:
                      "Our app provides easy-to-follow tutorials on how to take quizzes, including how to naavigate through questions, select an answer, and submit a quiz ."),
              10.spaceH,
              const HelpItemWidget(
                  label: "FAQs",
                  text:
                      "We have compiled a list of frequently asked questions to help children and parents find quick answers to common questions, such as how to create an account, how to purchase new quizzes, and how to reset a password."),
              10.spaceH,
              const HelpItemWidget(
                  label: "In-App Assistance",
                  text:
                      "In-App Assistance: Children can access our in-app chat feature for help while taking a quiz. Our friendly chatbot is available to answer questions, offer hints and tips, and provide assistance."),
              10.spaceH,
              const HelpItemWidget(
                  label: "Contact Us",
                  text:
                      "If children and parents have any questions or issues that cannot be resolved through our tutorials or FAQs, they can contact our support team at support@quizapp.com or call us at 555-1234."),
              10.spaceH,
              const HelpItemWidget(
                  label: "Feedback",
                  text:
                      "We value feedback from our users, and have a feedback form within the app where users can submit comments, suggestions, and requests for new quiz topics.")
            ],
          ),
        ));
  }
}
