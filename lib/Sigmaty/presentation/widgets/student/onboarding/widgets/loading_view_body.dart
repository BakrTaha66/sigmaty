import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class LoadingViewBody extends StatelessWidget {
  const LoadingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: ScreenSize.height(context),
        width: ScreenSize.width(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsData.backgroundFeatures),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LoadingAnimationWidget.beat(
                color: ColorsAsset.mainColor,
                size: ScreenSize.width(context) * 0.2,
              ),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.04,
            ),
            Text(
              'pleaseWaitingForCompletingSignUp'.tr(),
              style: FontAsset.font20WeightSemiBold
                  .copyWith(color: ColorsAsset.mainColor),
            )
          ],
        ),
      ),
    ));
  }
}
///////////////////////////////////////////