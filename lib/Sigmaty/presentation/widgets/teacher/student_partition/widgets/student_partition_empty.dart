import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class StudentPartitionEmpty{
  static   Padding studentPartitionEmpty(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(53.0),
      child: Container(
        height: ScreenSize.height(context),
        width: ScreenSize.width(context),
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: AssetImage())
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsData.studentEmpty,
              height: ScreenSize.height(context) * 0.2,
              width: ScreenSize.width(context) * 0.4,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            Text(
              'لم يتم الاشتراك حتى الان لي اضافت الطلاب ',
              style: FontAsset.font20WeightSemiBold
                  .copyWith(color: ColorsAsset.mainColor),
            )
          ],
        ),
      ),
    );
  }

}