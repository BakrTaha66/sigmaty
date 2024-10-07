import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';

class PackageLinear extends StatelessWidget {
  const PackageLinear({super.key, required this.color, required this.packageName, required this.onPressed});
final Color color;
final String packageName;
final void Function()onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      width: ScreenSize.width(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color),
      child: Container(
        height: 164,
        width: ScreenSize.width(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.25),
                  ColorsAsset.mainColor.withOpacity(0),
                  ColorsAsset.mainColor.withOpacity(1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             packageName,
              style: FontAsset.font20WeightSemiBold.copyWith(
                  color: ColorsAsset.secondaryColor, fontSize: 24),
            ),
            SizedBox(
              height: 24,
            ),
            CustomButtonWithoutIcon(
                title: 'اشترك معنا',
                height: 40,
                width: ScreenSize.width(context),
                onPressed: onPressed,
                primaryColor: ColorsAsset.mainColor,
                secondaryColor: ColorsAsset.secondaryColor,
                fontSize: 16,
                borderColor: ColorsAsset.mainColor)
          ],
        ),
      ),
    )
    ;
  }
}
