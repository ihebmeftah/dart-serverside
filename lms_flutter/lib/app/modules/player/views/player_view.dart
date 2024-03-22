import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';

import '../../../component/appcard.dart';
import '../../../component/appcategorywidget.dart';
import '../../../core/themes/themes.dart';
import '../../../routes/app_pages.dart';
import '../widgets/statsitemwidget.dart';
import '../../setting/views/setting_view.dart';
import '../controllers/player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  const PlayerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: DefaultTextStyle(
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: ThemesApp.secondary1),
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText('Hello 👋'),
                FadeAnimatedText('🔔 New category added!'),
                FadeAnimatedText('🔔 10 quiz added.'),
                FadeAnimatedText('Enjoy ☺️'),
              ],
            ),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: CircleAvatar(
                radius: 15.r,
                backgroundImage: AssetImage("userpic".toJpg),
              ),
              onPressed: () => Get.toNamed(Routes.PROFILE),
            );
          }),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.settings, size: 30));
            }),
            10.spaceW
          ],
        ),
        drawer: const Drawer(
          child: SettingView(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.QUIZ_PLAY),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
          child: const Text("Play"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeNav,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: ("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz_outlined),
              label: ("History"),
            ),
          ],
        ),
        body: GetBuilder<PlayerController>(
          id: "bottomNavBar",
          builder: (_) => SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Hello ',
                      children: <TextSpan>[
                        TextSpan(
                            text: "nathaniel",
                            style: TextStyle(color: ThemesApp.secondary1)),
                      ],
                    ),
                    style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        color: ThemesApp.yellow),
                  ),
                  10.spaceH,
                  AppCard(
                    width: Get.width,
                    height: 100.h,
                    color: ThemesApp.lightYellow,
                    shadow: false,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StatsItemWidget(
                              imgpath: "star".toPng,
                              name: "total points",
                              value: "540"),
                          Container(
                            height: Get.height,
                            width: 1.w,
                            color: ThemesApp.yellow,
                          ),
                          StatsItemWidget(
                              imgpath: "quizesdone".toPng,
                              name: "Quizzes done",
                              value: "540"),
                          Container(
                            height: Get.height,
                            width: 1.w,
                            color: ThemesApp.yellow,
                          ),
                          StatsItemWidget(
                              imgpath: "ranking".toPng,
                              name: "My ranking",
                              value: "Bronze"),
                        ],
                      ),
                    ),
                  ),
                  10.spaceH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CATEGORIES".capitalizeFirst!,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: ThemesApp.secondary1),
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(Routes.CATEGORY),
                          child: Text("See all (${controller.category}) "))
                    ],
                  ),
                  5.spaceH,
                  GridView.builder(
                    itemCount:
                        controller.category > 5 ? 4 : controller.category,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.w,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AppCard(
                        ontap: () {
                          if (index == 3 && controller.category > 5) {
                            Get.toNamed(Routes.CATEGORY);
                          } else {
                            Get.toNamed(Routes.QUIZES_CAT);
                          }
                        },
                        child: index == 3 && controller.category > 5
                            ? Text("+ ${controller.category - 3} others")
                            : AppCategroyWidget(
                                img: "boarding".toPng,
                                title: "Category",
                                subtitle: "1$index Quizzes",
                              )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
