import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/main_teacher/main_teacher_view_body.dart';

class MainTeacherView extends StatelessWidget {
  const MainTeacherView({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return MainTeacherViewBody(user: user,);
  }
}
