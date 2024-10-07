import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'begin_and_end_time.dart';

class LessonsDetails extends StatelessWidget {
  const LessonsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.65,
      width: ScreenSize.width(context),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: ScreenSize.height(context) * 0.04,
                backgroundImage: const AssetImage(AssetsData.person),
              ),
              SizedBox(width: ScreenSize.width(context) * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'محمد خالد',
                    style: FontAsset.font20WeightSemiBold,
                  ),
                  Text(
                    ' فيزياء',
                    style: FontAsset.font12WeightMedium,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: ScreenSize.height(context) * 0.02),
          const Divider(thickness: 1, color: Colors.grey),
          Row(
            children: [
              Container(
                height: ScreenSize.height(context) * 0.1,
                width: ScreenSize.width(context) * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(AssetsData.revision),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: ScreenSize.width(context) * 0.02),
              Expanded(
                child: Text(
                  'final revisions - session 1:\n rafsyuggs ',
                  style: FontAsset.font20WeightSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          const BeginAndEndTime(),
          SizedBox(height: ScreenSize.height(context) * 0.02),
          const Divider(thickness: 1, color: Colors.grey),
          SizedBox(height: ScreenSize.height(context) * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تمت مشاهدة',
                style: FontAsset.font14WeightSemiBold.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: ScreenSize.height(context) * 0.01),
              StepProgressIndicator(
                totalSteps: 100,
                currentStep: 32,
                size: 8,
                padding: 0,
                selectedColor: ColorsAsset.mainColor,
                unselectedColor: ColorsAsset.mainColor.withOpacity(0.2),
                roundedEdges: const Radius.circular(10),
              ),
              SizedBox(height: ScreenSize.height(context) * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '25%',
                    style: FontAsset.font14WeightSemiBold.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorsAsset.mainColor,
                    ),
                  ),
                  Text(
                    '100%',
                    style: FontAsset.font14WeightSemiBold.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorsAsset.mainColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          CustomButtonWithoutIcon(
            title: 'فتح',
            height: 0.06,
            width: 1,
            onPressed: () {
              // التأكد من أن المسار "/HistoryScreen2" صحيح في GoRouter
              context.push("/HistoryScreen2");
            },
            primaryColor: ColorsAsset.mainColor,
            secondaryColor: ColorsAsset.secondaryColor,
            fontSize: 16,
            borderColor: ColorsAsset.mainColor,
          ),
        ],
      ),
    );
  }
}




