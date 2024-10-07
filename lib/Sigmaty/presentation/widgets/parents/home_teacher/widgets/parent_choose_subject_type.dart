import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class ParentChooseSubjectType extends StatelessWidget {
  const ParentChooseSubjectType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String>subjects=[
      'مواد العربي',
      'مواد اللغات',
      'مواد الامريكان',

    ];
    return SizedBox(
      height: ScreenSize.height(context)*0.05,
      width: ScreenSize.width(context),
      child: ListView.builder(
        itemCount: subjects.length,
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsAsset.mainColor),
              child: Center(
                child: Text(
                 subjects[index],
                  style: FontAsset.font16WeightSemiBold
                      .copyWith(color: ColorsAsset.secondaryColor),
                ),
              ),
            ),
          ),
        );

      }),
    );
  }
}
