import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../student/lessons/widgets/begin_and_end_time.dart';

class StudentPartitionTeacher extends StatelessWidget {
  const StudentPartitionTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              '20 طالب',
              style: FontAsset.font16WeightSemiBold,
            ),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemExtent: ScreenSize.height(context) * 0.6,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      width: ScreenSize.width(context),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.black.withOpacity(0.1))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(AssetsData.person),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'الطالب: محمد',
                                style: FontAsset.font20WeightSemiBold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: AssetImage(AssetsData.revision),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 16,
                              ),
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
                          SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          const BeginAndEndTime(),
                          SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تمت مشاهدة',
                                style: FontAsset.font14WeightSemiBold
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              StepProgressIndicator(
                                totalSteps: 100,
                                currentStep: 32,
                                size: 8,
                                padding: 0,
                                selectedColor: ColorsAsset.mainColor,
                                unselectedColor: ColorsAsset.mainColor.withOpacity(0.2),
                                roundedEdges: const Radius.circular(10),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '25%',
                                    style: FontAsset.font14WeightSemiBold.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: ColorsAsset.mainColor),
                                  ),
                                  Text(
                                    '100%',
                                    style: FontAsset.font14WeightSemiBold.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: ColorsAsset.mainColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomButtonWithoutIcon(
                              title: 'فتح',
                              height: 40,
                              width: ScreenSize.width(context),
                              onPressed: () {},
                              primaryColor: ColorsAsset.mainColor,
                              secondaryColor: ColorsAsset.secondaryColor,
                              fontSize: 16,
                              borderColor: ColorsAsset.mainColor)
                        ],
                      ),
                    ),
                  );

                })
          ],
        ),
      ),
    );
  }
}
