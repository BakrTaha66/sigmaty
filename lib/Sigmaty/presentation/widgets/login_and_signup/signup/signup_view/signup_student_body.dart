import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/login_and_signup/signup/register_customization/register_student_customization.dart';
// import 'package:sigmaty/Sigmaty/presentation/widgets/login_and_signup/signup/register_customization/register_student_customization.dart';
// import 'package:sigmaty/Sigmaty/presentation/widgets/student/signup/widgets/register_customization.dart';

class SignUpStudentBody extends StatefulWidget {
  const SignUpStudentBody({super.key});

  @override
  State<SignUpStudentBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<SignUpStudentBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorsAsset.mainColor,
          body: RegisterCustomization(
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
