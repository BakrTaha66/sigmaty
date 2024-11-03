import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/teacher_home/teacher_home_view_body.dart';

class TeacherHomeView extends StatelessWidget {
  const TeacherHomeView({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TeacherHomeViewBody(user: user,)
    );
  }
}
