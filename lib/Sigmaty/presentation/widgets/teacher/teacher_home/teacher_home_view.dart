import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/teacher_home/widgets/teacher_home_view_body.dart';

class TeacherHomeView extends StatefulWidget {
  const TeacherHomeView({super.key});

  @override
  State<TeacherHomeView> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<TeacherHomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: TeacherHomeViewBody());
  }
}
