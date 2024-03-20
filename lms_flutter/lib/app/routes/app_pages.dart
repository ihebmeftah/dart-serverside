import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/quiz_play/bindings/quiz_play_binding.dart';
import '../modules/quiz_play/views/quiz_play_view.dart';
import '../modules/quizes_cat/bindings/quizes_cat_binding.dart';
import '../modules/quizes_cat/views/quizes_cat_view.dart';
import '../modules/quizhistory/bindings/quizhistory_binding.dart';
import '../modules/quizhistory/views/quizhistory_view.dart';
import '../modules/setting/bindings/setting_binding.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      bindings: [HomeBinding(), SettingBinding()],
    ),
    GetPage(
      name: _Paths.QUIZHISTORY,
      page: () => const QuizhistoryView(),
      binding: QuizhistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.QUIZES_CAT,
      page: () => const QuizesCatView(),
      binding: QuizesCatBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_PLAY,
      page: () => const QuizPlayView(),
      binding: QuizPlayBinding(),
    ),
  ];
}
