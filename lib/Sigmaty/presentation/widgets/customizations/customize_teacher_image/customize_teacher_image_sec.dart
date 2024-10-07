

import 'package:flutter/material.dart';

import '../../../../constants/colors_asset.dart';
import '../../../../constants/font_asset.dart';
import '../../../../constants/screen_size.dart';

class CustomizeTeacherImageSec extends StatelessWidget {
  const CustomizeTeacherImageSec({super.key, required this.imageUrl, required this.subjectName, required this.teacherName, required this.yearOfSecondary});
  final String imageUrl;
  final String subjectName;
  final String teacherName;
  final String yearOfSecondary;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.4,
      width: ScreenSize.width(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(imageUrl), fit: BoxFit.fill),
      ),
      child: Container(
        height: ScreenSize.height(context) * 0.4,
        width: ScreenSize.width(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [
                  const Color(0xff249EF1),
                  Colors.white.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 48,
                width: ScreenSize.width(context) * 0.2,
                decoration: const BoxDecoration(
                    color: ColorsAsset.mainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    subjectName,
                    style: FontAsset.font16WeightSemiBold
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text:'الاستاذ: ',
                                style: FontAsset.font16WeightSemiBold
                                    .copyWith(color: ColorsAsset.secondaryColor),
                              ),
                              TextSpan(
                                text:teacherName,
                                style: FontAsset.font16WeightSemiBold
                                    .copyWith(color: ColorsAsset.secondaryColor),
                              ),
                            ]
                        )
                    ),
                    Text(yearOfSecondary,style: FontAsset.font12WeightMedium.copyWith(color: ColorsAsset.secondaryColor),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
