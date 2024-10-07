import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/onboarding/widgets/features_users_view_body.dart';

class FeaturesUsersView extends StatelessWidget {
  const FeaturesUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturesUsersViewBody(student: 'student', teacher: 'teacher', parents: 'parents', visitor: 'visitor',);
  }
}
