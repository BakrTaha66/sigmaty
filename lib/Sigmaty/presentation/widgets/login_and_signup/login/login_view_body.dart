import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/login_and_signup/login/widgets/login_customization.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key, required this.userType, });
  final String userType;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsAsset.mainColor,
      body: LoginCustomization(userType: widget.userType,),
    ));
  }
}
