import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class CustomizeTeacherImage extends StatelessWidget {
  const CustomizeTeacherImage({super.key, required this.imageUrl, required this.subjectName, required this.teacherName, required this.yearOfSecondary, required this.onTap,});
final String imageUrl;
final String subjectName;
final String teacherName;
final String yearOfSecondary;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
          height: ScreenSize.height(context) * 0.4,
          width: ScreenSize.width(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.fill),
            ),
            child: Container(
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
                      height: 56,
                      width: ScreenSize.width(context) * 0.3,
                      decoration: const BoxDecoration(
                          color: ColorsAsset.mainColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(20))),
                      child: Center(
                        child: Text(
                          subjectName,
                          style: FontAsset.font20WeightSemiBold
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
                                      style: FontAsset.font20WeightSemiBold
                                          .copyWith(color: ColorsAsset.secondaryColor),
                                    ),
                                    TextSpan(
                                      text:teacherName,
                                      style: FontAsset.font20WeightSemiBold
                                          .copyWith(color: ColorsAsset.secondaryColor),
                                    ),
                                  ]
                              )
                          ),
                          Text(yearOfSecondary,style: FontAsset.font14WeightSemiBold.copyWith(color: ColorsAsset.secondaryColor),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
