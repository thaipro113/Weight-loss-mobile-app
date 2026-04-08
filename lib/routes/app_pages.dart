import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../views/splash/splash_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/auth/login_view.dart';
import '../views/main/main_view.dart';
import '../views/workout/day_detail_view.dart';
import '../views/workout/exercise_play_view.dart';
import '../views/shared/placeholder_view.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashView()),
    GetPage(name: AppRoutes.ONBOARDING, page: () => const OnboardingView()),
    GetPage(name: AppRoutes.LOGIN, page: () => const LoginView()),
    GetPage(name: AppRoutes.HOME, page: () => const MainView()),
    GetPage(name: AppRoutes.DAY_DETAIL, page: () => const DayDetailView()),
    GetPage(name: AppRoutes.EXERCISE_PLAY, page: () => const ExercisePlayView()),
    
    // --- Survey Flow ---
    ...[
      AppRoutes.SURVEY_WELCOME, AppRoutes.SURVEY_GENDER, AppRoutes.SURVEY_GOAL,
      AppRoutes.SURVEY_FOCUS_AREA, AppRoutes.SURVEY_CURRENT_BODY, AppRoutes.SURVEY_TARGET_BODY,
      AppRoutes.SURVEY_AGE, AppRoutes.SURVEY_HEIGHT, AppRoutes.SURVEY_WEIGHT,
      AppRoutes.SURVEY_INJURY, AppRoutes.SURVEY_FREQUENCY, AppRoutes.SURVEY_PROCESSING, AppRoutes.SURVEY_SUCCESS
    ].map((route) => GetPage(
      name: route, 
      page: () => PlaceholderView(title: 'Khảo sát: ${route.split("/").last.toUpperCase()}', icon: Icons.question_answer)
    )).toList(),

    // --- Discover Flow ---
    GetPage(name: AppRoutes.DISCOVER_MAIN, page: () => const PlaceholderView(title: 'Khám Phá', icon: Icons.explore)),
    ...[
      AppRoutes.DISCOVER_ABS, AppRoutes.DISCOVER_CHEST, AppRoutes.DISCOVER_ARMS,
      AppRoutes.DISCOVER_LEGS, AppRoutes.DISCOVER_FULLBODY, AppRoutes.DISCOVER_YOGA,
      AppRoutes.DISCOVER_HIIT, AppRoutes.DISCOVER_STRETCHING, AppRoutes.DISCOVER_CHALLENGES,
      AppRoutes.DISCOVER_ARTICLES, AppRoutes.DISCOVER_ARTICLE_DETAIL, AppRoutes.DISCOVER_MEAL_PLAN
    ].map((route) => GetPage(
      name: route, 
      page: () => PlaceholderView(title: 'Chuyên mục: ${route.split("/").last.toUpperCase()}', icon: Icons.fitness_center)
    )).toList(),

    // --- Profile & Settings Flow ---
    GetPage(name: AppRoutes.PROFILE_MAIN, page: () => const PlaceholderView(title: 'Hồ sơ cá nhân', icon: Icons.person)),
    ...[
      AppRoutes.PROFILE_EDIT, AppRoutes.PROFILE_HISTORY, AppRoutes.PROFILE_WEIGHT_TRACKER,
      AppRoutes.PROFILE_ACHIEVEMENTS, AppRoutes.PROFILE_PREMIUM, AppRoutes.SETTINGS_MAIN,
      AppRoutes.SETTINGS_REMINDERS, AppRoutes.SETTINGS_SOUNDS, AppRoutes.SETTINGS_LANGUAGE,
      AppRoutes.SETTINGS_THEME, AppRoutes.SETTINGS_SYNC, AppRoutes.SETTINGS_PRIVACY,
      AppRoutes.SETTINGS_TERMS, AppRoutes.SETTINGS_HELP, AppRoutes.SETTINGS_CONTACT
    ].map((route) => GetPage(
      name: route, 
      page: () => PlaceholderView(title: 'Hồ sơ & Cài đặt: ${route.split("/").last.toUpperCase()}', icon: Icons.settings)
    )).toList(),
  ];
}
