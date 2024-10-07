import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class TeacherAccountViewBody extends StatelessWidget {
  const TeacherAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'الملف الشخصي',
              style: FontAsset.font16WeightSemiBold,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(AssetsData.person),
                      ),
                      SizedBox(
                        width: ScreenSize.width(context) * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'محمد',
                            style: FontAsset.font14WeightSemiBold,
                          ),
                          Text(
                            '+2 01023458956',
                            style: FontAsset.font12WeightMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5)),
                          )
                        ],
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),

           
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsData.technicalSupport,
                        height: ScreenSize.height(context) * 0.03,
                        width: ScreenSize.width(context) * 0.03,
                      ),
                      SizedBox(
                        width: ScreenSize.width(context) * 0.02,
                      ),
                      Text('الدعم الفني',style: FontAsset.font16WeightSemiBold,)
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsData.settings,
                        height: ScreenSize.height(context) * 0.03,
                        width: ScreenSize.width(context) * 0.03,
                      ),
                      SizedBox(
                        width: ScreenSize.width(context) * 0.02,
                      ),
                      Text('الاعدادات',style: FontAsset.font16WeightSemiBold,)
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),

            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),

            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsData.logout,
                        height: ScreenSize.height(context) * 0.03,
                        width: ScreenSize.width(context) * 0.03,
                      ),
                      SizedBox(
                        width: ScreenSize.width(context) * 0.02,
                      ),
                      Text('خروج',style: FontAsset.font16WeightSemiBold,)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
