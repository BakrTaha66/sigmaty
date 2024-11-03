import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/main_taecher_screen/main_student_view_body.dart';

class MainStudentView extends StatelessWidget {
  const MainStudentView({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return MainStudentViewBody(user: user,);
  }
}
