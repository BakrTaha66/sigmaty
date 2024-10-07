import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/colors_asset.dart';
import '../../../../../constants/font_asset.dart';
import '../../../../../constants/screen_size.dart';
import '../../../customizations/custom_button_without_icon/custom_button_without_icon.dart';

class TeacherChapterContainer extends StatelessWidget {
  const TeacherChapterContainer({
    super.key,
    required this.lessonPic,
    required this.lessonName,
    required this.enterPressed,
    required this.addLessonPressed,
  });

  final String lessonPic;
  final String lessonName;
  final void Function() enterPressed;
  final void Function() addLessonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: ScreenSize.height(context) * 0.5,
      width: ScreenSize.width(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          color: ColorsAsset.secondaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: ScreenSize.height(context) * 0.06,
                width: ScreenSize.width(context) * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(lessonPic), fit: BoxFit.fill)),
              ),
              SizedBox(
                width: ScreenSize.width(context) * 0.01,
              ),
              Text(
                lessonName,
                style: FontAsset.font20WeightSemiBold,
              ),
            ],
          ),
          SizedBox(
            height: ScreenSize.height(context) * 0.04,
          ),
          Divider(
            height: ScreenSize.height(context) * 0.001,
            color: ColorsAsset.hintColor.withOpacity(0.2),
            thickness: 1,
          ),
          SizedBox(
            height: ScreenSize.height(context) * 0.04,
          ),
          CustomButtonWithoutIcon(
              title: 'دخول',
              height: 0.06,
              width: 1,
              onPressed: () {
                context.push("/SecondLessonScreenView");
              },
              primaryColor: ColorsAsset.mainColor,
              secondaryColor: ColorsAsset.secondaryColor,
              fontSize: 16,
              borderColor: ColorsAsset.mainColor),
          SizedBox(
            height: ScreenSize.height(context) * 0.02,
          ),
          CustomButtonWithoutIcon(
              title: 'اضافة حصة',
              height: 0.06,
              width: 1,
              onPressed: addLessonPressed,
              primaryColor: ColorsAsset.secondaryColor,
              secondaryColor: ColorsAsset.mainColor,
              fontSize: 16,
              borderColor: ColorsAsset.mainColor),
        ],
      ),
    );
  }
}
