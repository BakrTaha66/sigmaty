import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/packages/packages_view_body.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return PackagesViewBody(user: user,);
  }
}
