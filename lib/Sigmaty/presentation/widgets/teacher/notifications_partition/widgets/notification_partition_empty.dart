import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';

import '../../../../../constants/screen_size.dart';

class NotificationPartitionEmpty extends StatelessWidget {
  const NotificationPartitionEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              AssetsData.notificationEmpty,
              height: ScreenSize.height(context) * 0.2,
              width: ScreenSize.width(context) * 0.4,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            Text(
              'لا يوجد اي اشعارات حتى الان ',
              style: FontAsset.font20WeightSemiBold
                  .copyWith(color: ColorsAsset.mainColor),
            )
          ],
        ),
      ),
    );
  }
}
