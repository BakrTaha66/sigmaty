import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/login_and_signup/signup/register_customization/register_father.dart';

class SignUpFatherBody extends StatefulWidget {
  const SignUpFatherBody({super.key});

  @override
  State<SignUpFatherBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<SignUpFatherBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsAsset.mainColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: RegisterFatherCustomization(
            emailController: emailController,
            passwordController: passwordController,
            onPressedForgotPassword: () {},
            onPressedGoogle: () {},
            onPressedFacebook: () {},
            onPressedApple: () {},
            onPressedLogin: () {},
            onPressedRegister: () {}
        ),
      ),
    ));
  }
}
