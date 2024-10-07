import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/login_and_signup/signup/register_customization/register_teacher_customization.dart';

class SignUpTeacherBody extends StatefulWidget {
  const SignUpTeacherBody({super.key});

  @override
  State<SignUpTeacherBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<SignUpTeacherBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorsAsset.mainColor,
          body: RegisterTeacherCustomization(
              emailController: emailController,
              passwordController: passwordController,
              onPressedForgotPassword: () {},
              onPressedGoogle: () {},
              onPressedFacebook: () {},
              onPressedApple: () {},
              onPressedLogin: () {},
              onPressedRegister: () {}),
        ));
  }
}
