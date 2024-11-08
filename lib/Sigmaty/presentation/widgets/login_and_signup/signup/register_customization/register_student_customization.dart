import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/student/main_teacher_screen/main_student_view.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_dropdown_app/custom_dropdown_app.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';

import '../../../../../helper/helperfunctions.dart';
import '../../../../../services/auth.dart';
import '../../../../../services/database.dart';
import '../../../../manager/signup_cubit/signup_cubit.dart';
import '../../../student/main_taecher_screen/main_student_view_body.dart';

class RegisterCustomization extends StatefulWidget {
  const RegisterCustomization({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressedForgotPassword,
    required this.onPressedGoogle,
    required this.onPressedFacebook,
    required this.onPressedApple,
    required this.onPressedLogin,
    required this.onPressedRegister,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onPressedForgotPassword;
  final void Function() onPressedGoogle;
  final void Function() onPressedFacebook;
  final void Function() onPressedApple;
  final void Function() onPressedLogin;
  final void Function() onPressedRegister;

  @override
  State<RegisterCustomization> createState() => _LoginCustomizationState();
}

class _LoginCustomizationState extends State<RegisterCustomization> {

  bool isLoading = false;
  DatabaseMethods databaseMethods = DatabaseMethods();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'US');
  GlobalKey<FormState> _key = GlobalKey();

  String age = '';
  String academicYear = '';
  String departmentA = '';
  String departmentB = '';

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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'register'.tr(),
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
            const SizedBox(
              height: 48,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: ColorsAsset.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                      hintText: 'name'.tr(),
                      controller: nameController,
                      obscureText: false,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                    ),
                    const SizedBox(
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
                      hintText: 'email'.tr(),
                      controller: widget.emailController,
                      obscureText: false,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(width: 1.0, color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value ? 'Valid' : 'Invalid');
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          initialValue: number,
                          inputBorder: InputBorder.none,
                          textFieldController: phoneController,
                          formatInput: true,
                          hintText: 'enterPhoneNumber'.tr(),
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdownApp(
                            items: ["16", "17", "18", "19"],
                            hintText: 'السن',
                            onChanged: (value) {
                              setState(() {
                                age = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: CustomDropdownApp(
                            items: [
                              "الاول ثانوي",
                              "الثاني ثانوي",
                              "الثالث ثانوي",
                            ],
                            hintText: 'السنة الدراسية',
                            onChanged: (value) {
                              setState(() {
                                academicYear = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdownApp(
                            items: const [
                              "عربي",
                              "لغات",
                              "اميريكان",
                              "IG",
                            ],
                            hintText: 'القسم',
                            onChanged: (value) {
                              setState(() {
                                departmentA = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: CustomDropdownApp(
                            items: const ["علمي علوم", "علمي رياضة", "ادبي"],
                            hintText: 'الشعبة ',
                            onChanged: (value) {
                              setState(() {
                                departmentB = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
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
                      hintText: 'school'.tr(),
                      controller: schoolController,
                      obscureText: false,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                    ),
                    const SizedBox(
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
                      controller: widget.passwordController,
                      obscureText: true,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                    ),
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
                      controller: confirmPasswordController,
                      obscureText: true,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButtonWithoutIcon(
                        title: 'register'.tr(),
                        height: 56,
                        width: ScreenSize.width(context),
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            User? user = await Auth.registerUsingEmailPassword(
                                name: nameController.text,
                                email: widget.emailController.text,
                                password: widget.passwordController.text);

                            Map<String, dynamic>  newStudent = {
                              'name': nameController.text,
                              'email': widget.emailController.text,
                              'phone': phoneController.text,
                              'age': age,
                              'academicYear': academicYear,
                              'departmentA': departmentA,
                              'departmentB': departmentB,
                              'school': schoolController.text,
                            };

                            HelperFunctions.saveUserEmailSharedPreference( widget.emailController.text);
                            HelperFunctions.saveUserNameSharedPreference(nameController.text);

                            setState(() {
                              isLoading = true;
                            });

                            if (user != null) {
                              databaseMethods.student(user.uid, newStudent);
                              HelperFunctions.saveUserLoggedInSharedPreference(true);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) =>
                                        MainStudentView(user: user,)),
                              );
                            }
                          }
                        },
                        primaryColor: ColorsAsset.mainColor,
                        secondaryColor: Colors.white,
                        fontSize: 16,
                        borderColor: Colors.grey.withOpacity(0.5)),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('doyouHaveAnAccount'.tr(),
                            style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)
                                .copyWith(color: Colors.blue)),
                        Text(','.tr(),
                            style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)
                                .copyWith(color: Colors.blue)),
                        TextButton(
                            onPressed: () async {},
                            child: Text('login'.tr(),
                                style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)
                                    .copyWith(color: Colors.blue))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
