import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/chapters_screen/chapters_screen_body.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/history/history_screen2.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/history/second_lesson_screen_view/second_lesson_screen_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/login/login_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/onboarding/features_users_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/onboarding/onboarding_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/onboarding/splash_screen_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/parents/main_parents_screen/main_parent_screen_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/student/main_teacher_screen/main_student_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/teacher/main_teacher/main_teacher_view.dart';
import 'package:sigmaty/Sigmaty/presentation/payment_screen/payment_screen1.dart';
import 'package:sigmaty/Sigmaty/presentation/payment_screen/payment_screen2.dart';
import 'package:sigmaty/Sigmaty/presentation/search_home_screen.dart/search_home_screen_body.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/parents/home_teacher/widgets/teacher_chapters/teacher_chapters_list.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/account/widgets/account_detail.dart';

class MyRouter {
  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }

  static GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            SplashScreenView(),
        routes: [
          GoRoute(
              path: 'Onboarding',
              builder: (BuildContext context, GoRouterState state) =>
                  OnboardingView()),
          GoRoute(
              path: 'MainStudentScreen',
              builder: (BuildContext context, GoRouterState state) =>
                  MainStudentView()),
          GoRoute(
              path: 'MainParentView',
              builder: (BuildContext context, GoRouterState state) =>
                  MainParentScreenView()),
          GoRoute(
              path: 'MainTeacherView',
              builder: (BuildContext context, GoRouterState state) =>
                  MainTeacherView()),
          GoRoute(
              path: 'FeaturesUser',
              builder: (BuildContext context, GoRouterState state) =>
                  FeaturesUsersView()),
          GoRoute(
              path: 'Login',
              builder: (BuildContext context, GoRouterState state) =>
                  LoginView(userType: '',)),
          GoRoute(
              path: 'StudentAccountDetail',
              builder: (BuildContext context, GoRouterState state) =>
                  AccountDetail()),
          GoRoute(
              path: 'SearchHomeScreenBody',
              builder: (BuildContext context, GoRouterState state) =>
                  SearchHomeScreenBody()),
          GoRoute(
            path: 'HistoryScreen2', 
            builder: (BuildContext context, GoRouterState state) =>
                const HistoryScreen2(),
          ),
          GoRoute(
              path: 'SecondLessonScreenView',
              builder: (BuildContext context, GoRouterState state) =>
                  SecondLessonScreenView(user: null,)),
                         GoRoute(
              path: 'LoginView',
              builder: (BuildContext context, GoRouterState state) =>
                  LoginView(userType: '',)),
        ]),
  ]);
}
