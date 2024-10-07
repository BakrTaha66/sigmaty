import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/login_and_signup/login/login_view_body.dart';

class RegisterFatherCustomization extends StatefulWidget {
  const RegisterFatherCustomization({
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
  State<RegisterFatherCustomization> createState() => _LoginCustomizationState();
}

class _LoginCustomizationState extends State<RegisterFatherCustomization> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController schoolcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController password2controller = TextEditingController();
  final TextEditingController codecontroller = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'US');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
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
        SizedBox(
          height: ScreenSize.height(context) * 0.1,
        ),
        SingleChildScrollView(
          child: Container(
            height: ScreenSize.height(context) * 1.5,
            width: ScreenSize.width(context),
            decoration: const BoxDecoration(
                color: ColorsAsset.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
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
                      controller: namecontroller,
                      obscureText: false,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                      labelText: 'name'.tr(),
                      labelFontColor: ColorsAsset.hintColor),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
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
                      labelText: 'email'.tr(),
                      labelFontColor: ColorsAsset.hintColor),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
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
                        textFieldController: controller,
                        formatInput: true,
                        inputDecoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey)),
                          labelText: 'phoneNumber'.tr(),
                          hintText: 'enterPhoneNumber'.tr(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
                  ),

                       CustomFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'fieldIsRequired'.tr();
                        } else {
                          return null;
                        }
                      },
                      hintText: 'enterCode'.tr(),
                      controller: codecontroller,
                      obscureText: false,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 8,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 16,
                      labelText: 'enterCode'.tr(),
                      labelFontColor: ColorsAsset.hintColor),
                
       
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
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
                      labelText: 'password'.tr(),
                      labelFontColor: ColorsAsset.hintColor),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
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
                      controller: password2controller,
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
                    height: ScreenSize.height(context) * 0.05,
                  ),
                  CustomButtonWithoutIcon(
                      title: 'register'.tr(),
                      height: 0.07,
                      width: 1,
                      onPressed: () {

                      },
                      primaryColor: Colors.grey.withOpacity(0.5),
                      secondaryColor: Colors.grey,
                      fontSize: 16,
                      borderColor: Colors.grey.withOpacity(0.5)),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.04,
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
                          onPressed: () {

                          },
                          child: Text('login'.tr(),
                              style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600)
                                  .copyWith(color: Colors.blue))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
