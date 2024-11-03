import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button/custom_button.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';

class CustomizeTeacherProfile extends StatelessWidget {
  const CustomizeTeacherProfile({
    super.key,
    required this.teacherName,
    required this.subjectName,
    required this.courseName,
    required this.bio,
    required this.followOnPressed,
    required this.lectureOnPressed,
    required this.materialOnPressed,
    required this.bookingOnPressed,
    required this.secondaryYear,
    required this.imageUrl,
  });

  final String teacherName;
  final String subjectName;
  final String courseName;
  final String bio;
  final String secondaryYear;
  final String imageUrl;
  final void Function() followOnPressed;
  final void Function() lectureOnPressed;
  final void Function() materialOnPressed;
  final void Function() bookingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsAsset.mainColor,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorsAsset.secondaryColor,
              )),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: ScreenSize.height(context) * 0.75,
                  width: ScreenSize.width(context),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    color: ColorsAsset.mainColor,
                  ),
                ),
                Container(
                  height: ScreenSize.height(context) * 0.75,
                  width: ScreenSize.width(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      gradient: LinearGradient(
                          colors: [
                            Color(0x00000080).withOpacity(0.5),
                            Color(0x00000080).withOpacity(0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                Column(
                  children: [
                    Text(
                      subjectName,
                      style: FontAsset.font16WeightSemiBold
                          .copyWith(color: ColorsAsset.secondaryColor),
                    ),
                    Text(
                      courseName,
                      style: FontAsset.font20WeightSemiBold
                          .copyWith(color: ColorsAsset.secondaryColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 340,
                        width: ScreenSize.width(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(imageUrl),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      teacherName,
                      style: FontAsset.font16WeightSemiBold
                          .copyWith(color: ColorsAsset.secondaryColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomButtonWithoutIcon(
                        title: 'متابعة',
                        height: 40,
                        width: ScreenSize.width(context),
                        onPressed: () {},
                        primaryColor: ColorsAsset.mainColor,
                        secondaryColor: ColorsAsset.secondaryColor,
                        fontSize: 16,
                        borderColor: ColorsAsset.mainColor),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  width: ScreenSize.width(context),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        color: Color(0xFFFFFFFF).withOpacity(0.05)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsData.reading,
                                color: ColorsAsset.secondaryColor,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                secondaryYear,
                                overflow: TextOverflow.fade,
                                style: FontAsset.font12WeightMedium.copyWith(
                                    color: ColorsAsset.secondaryColor,
                                    fontSize: 10),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              context.push("/TeacherChaptersList");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AssetsData.videosIcon,
                                  color: ColorsAsset.secondaryColor,
                                  height: 16,
                                  width: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'محاضرات',
                                  style: FontAsset.font12WeightMedium
                                      .copyWith(
                                      color: ColorsAsset.secondaryColor,
                                      fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetsData.bookingIcon,
                                color: ColorsAsset.secondaryColor,
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'حجوزات',
                                style: FontAsset.font12WeightMedium.copyWith(
                                    color: ColorsAsset.secondaryColor,
                                    fontSize: 10),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetsData.materialsIcon,
                                color: ColorsAsset.secondaryColor,
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'ملازم',
                                style: FontAsset.font12WeightMedium.copyWith(
                                    color: ColorsAsset.secondaryColor,
                                    fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'السيرة الذاتية',
                    style: FontAsset.font16WeightSemiBold,
                  ),
                  Text(
                    bio,
                    style: FontAsset.font14WeightSemiBold
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 24,
                  ),

                ],
              ),
            ),
            CustomButton(
                title: 'المحاضرات',
                height: 80,
                width: ScreenSize.width(context),
                onPressed: lectureOnPressed,
                primaryColor: ColorsAsset.secondaryColor,
                secondaryColor: ColorsAsset.mainColor,
                fontSize: 16,
                assetPath: AssetsData.videoLibrary,
                assetImg: AssetsData.customButton,
                iconHeight: 0.05,
                iconWidth: 0.05,
                borderColor: ColorsAsset.mainColor),
            SizedBox(
              height: 16,
            ),
            CustomButton(
                title: 'الملزمة',
                height: 80,
                width: ScreenSize.width(context),
                onPressed: materialOnPressed,
                primaryColor: ColorsAsset.secondaryColor,
                secondaryColor: ColorsAsset.mainColor,
                fontSize: 16,
                assetPath: AssetsData.bookMarkIcon,
                assetImg: AssetsData.customButton,
                iconHeight: 0.05,
                iconWidth: 0.05,
                borderColor: ColorsAsset.mainColor),
            SizedBox(
              height: 16,
            ),
            CustomButton(
                title: 'الحجوزات',
                height: 80,
                width: ScreenSize.width(context),
                onPressed: bookingOnPressed,
                primaryColor: ColorsAsset.secondaryColor,
                secondaryColor: ColorsAsset.mainColor,
                fontSize: 16,
                assetPath: AssetsData.calender,
                assetImg: AssetsData.customButton,
                iconHeight: 0.05,
                iconWidth: 0.05,
                borderColor: ColorsAsset.mainColor),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
                      // context.push("/SearchHomeScreenBody");
