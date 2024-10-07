import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/login_and_signup/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key,
    required this.userType,
  });
  final String userType;

  @override
  Widget build(BuildContext context) {
    return LoginViewBody(userType: userType,);
  }
}
