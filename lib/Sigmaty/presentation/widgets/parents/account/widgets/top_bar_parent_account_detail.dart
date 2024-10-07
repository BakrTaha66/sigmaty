import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class TopBarParentAccountDetail extends StatelessWidget {
  const TopBarParentAccountDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.2,
      width: ScreenSize.width(context),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
          color: ColorsAsset.mainColor),
      child: Container(
        height: ScreenSize.height(context) * 0.2,
        width: ScreenSize.width(context),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.5),
              Colors.white.withOpacity(0)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: ScreenSize.height(context) * 0.04,
                    backgroundImage: AssetImage(AssetsData.person),
                  ),
                  SizedBox(
                    width: ScreenSize.width(context) * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'محمد خالد',
                        style: FontAsset.font20WeightSemiBold
                            .copyWith(color: ColorsAsset.secondaryColor),
                      ),
                      Text(
                        ' الصف الثالث ثانوي',
                        style: FontAsset.font12WeightMedium
                            .copyWith(color: ColorsAsset.secondaryColor),
                      ),

                    ],
                  )
                ],
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding:EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      decoration: BoxDecoration(
                          color: ColorsAsset.secondaryColor,
                          borderRadius:BorderRadius.circular(8)
                      ),
                      child: Text(
                        'تعديل',
                        style: FontAsset.font14WeightSemiBold
                            .copyWith(color: ColorsAsset.mainColor),
                      ),
                    ),
                  ),
                  SizedBox(width: ScreenSize.width(context)*0.02,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding:EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:BorderRadius.circular(8),
                          border: Border.all(color: ColorsAsset.secondaryColor)
                      ),
                      child: Text(
                        'كود الطالب',
                        style: FontAsset.font14WeightSemiBold
                            .copyWith(color: ColorsAsset.secondaryColor),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
