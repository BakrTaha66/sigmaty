import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/lessons/second_lesson_screen_view_body.dart';

class SecondLessonScreenView extends StatelessWidget {
  const SecondLessonScreenView({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return SecondLessonScreenViewBody(user: user,);
  }
}
