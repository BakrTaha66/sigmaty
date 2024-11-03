import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/student_home_view_body.dart';

class StudentHomeView extends StatelessWidget {
  const StudentHomeView({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return StudentHomeViewBody(user: user,);
  }
}
