import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/manager/social_auth_cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/student/main_teacher_screen/main_student_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/teacher/main_teacher/main_teacher_view.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button/custom_button.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';

import '../../../../../services/auth.dart';
import '../../../customizations/custom_button/custom_button_auth.dart';
import '../../../parents/main_taecher_screen/parent_main_teacher_view_body.dart';
import '../../../student/main_taecher_screen/main_student_view_body.dart';
import '../../../teacher/main_teacher/main_teacher_view_body.dart';
import '../../signup/signup_view/sign_up_father_body.dart';
import '../../signup/signup_view/signup_student_body.dart';
import '../../signup/signup_view/signup_teacher_body.dart';

class LoginCustomization extends StatefulWidget {
  const LoginCustomization({
    super.key,
    required this.userType,
  });
  final String userType;

  @override
  State<LoginCustomization> createState() => _LoginCustomizationState();
}

class _LoginCustomizationState extends State<LoginCustomization> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  void navigateBasedOnUserType(BuildContext context) {
    if (widget.userType == 'student') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpStudentBody()),
      );
    } else if (widget.userType == 'teacher') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpTeacherBody()),
      );
    } else if (widget.userType == 'parents') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpFatherBody()),
      );
    } else {
      // Handle unknown user type if needed
      print('Unknown user type');
    }
  }

  void navigateToMainScreen(BuildContext context) async {
    if (_key.currentState!.validate()) {
      User? user = await Auth.signInUsingEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );
      if (user != null && widget.userType == 'student') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainStudentView(user: user,)),
        );
      } else if (user != null && widget.userType == 'teacher') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainTeacherView(user: user,)),
        );
      } else if (user != null && widget.userType == 'parents') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParentMainTeacherViewBody()),
        );
      } else {
        // Handle unknown user type if needed
        print('Unknown user type');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'login'.tr(),
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    'loginToTheAccount'.tr(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              padding: EdgeInsets.all(24),
              decoration: const BoxDecoration(
                  color: ColorsAsset.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                children: [
                  CustomFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'fieldIsRequired'.tr();
                        } else {
                          return null;
                        }
                      },
                      hintText: 'email'.tr(),
                      controller: _emailController,
                      obscureText: false,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                      labelText: 'email'.tr(),
                      labelFontColor: ColorsAsset.hintColor),
                  SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'fieldIsRequired'.tr();
                        } else {
                          return null;
                        }
                      },
                      hintText: 'password'.tr(),
                      controller: _passwordController,
                      obscureText: true,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                      labelText: 'password'.tr(),
                      labelFontColor: ColorsAsset.hintColor),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'forgotPassword'.tr(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorsAsset.hintColor),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButtonWithoutIcon(
                      title: 'login'.tr(),
                      height: 56,
                      width: ScreenSize.width(context),
                      onPressed: () {
                        navigateToMainScreen(context);
                      },
                      primaryColor: ColorsAsset.mainColor,
                      secondaryColor: Colors.white,
                      fontSize: 16,
                      borderColor: Colors.grey.withOpacity(0.5)),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 1,
                        width: 124,
                        color: ColorsAsset.hintColor.withOpacity(0.2),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'or'.tr(),
                        style: const TextStyle(
                            color: ColorsAsset.hintColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 1,
                        width: 124,
                        color: ColorsAsset.hintColor.withOpacity(0.2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButtonAuth(
                    title: 'google'.tr(),
                    height: 56,
                    width: ScreenSize.width(context),
                    onPressed: () async {
                      await BlocProvider.of<GoogleSignInCubit>(context,
                              listen: true)
                          .signInWithGoogle();
                    },
                    primaryColor: Colors.white,
                    secondaryColor: Colors.black,
                    fontSize: 16,
                    assetPath: AssetsData.google,
                    iconHeight: 0.03,
                    iconWidth: 0.03,
                    borderColor: Colors.grey.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButtonAuth(
                    title: 'facebook'.tr(),
                    height: 56,
                    width: ScreenSize.width(context),
                    onPressed: () {},
                    primaryColor: Colors.white,
                    secondaryColor: Colors.black,
                    fontSize: 16,
                    assetPath: AssetsData.facebook,
                    iconHeight: 0.03,
                    iconWidth: 0.03,
                    borderColor: Colors.grey.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButtonAuth(
                    title: 'apple'.tr(),
                    height: 56,
                    width: ScreenSize.width(context),
                    onPressed: () {},
                    primaryColor: Colors.white,
                    secondaryColor: Colors.black,
                    fontSize: 16,
                    assetPath: AssetsData.apple,
                    iconHeight: 0.03,
                    iconWidth: 0.03,
                    borderColor: Colors.grey.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'doNotHaveAnAccount'.tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ','.tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {
                            navigateBasedOnUserType(context);
                          },
                          child: Text(
                            'register'.tr(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                      Text(
                        '?'.tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
