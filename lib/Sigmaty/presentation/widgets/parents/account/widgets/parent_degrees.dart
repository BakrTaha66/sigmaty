import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ParentDegrees extends StatelessWidget {
  const ParentDegrees({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return                   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: ScreenSize.height(context)*0.4,
              width: ScreenSize.width(context),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black.withOpacity(0.1))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            ,
                          ),
                          Text(
                            ' فيزياء',
                            style: FontAsset.font12WeightMedium
                            ,
                          ),

                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenSize.height(context)*0.02,
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: ScreenSize.height(context)*0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        height: ScreenSize.height(context)*0.1,
                        width: ScreenSize.width(context)*0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage(AssetsData.revision),fit: BoxFit.fill)
                        ),
                      ),
                      SizedBox(
                        width: ScreenSize.width(context)*0.02,
                      ),
                      Text(
                        'final revisions - session 1:\n rafsyuggs ',
                        style: FontAsset.font20WeightSemiBold,maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                      ),

                    ],
                  ),
                  SizedBox(
                    height: ScreenSize.height(context)*0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('2/10',style: FontAsset.font16WeightMedium,),
                      StepProgressIndicator(
                        size: ScreenSize.height(context)*0.02,
                        totalSteps: 10,
                        currentStep: 2,
                        selectedColor: Colors.red,
                        unselectedColor: Colors.white,

                      )
                    ],
                  ),

                ],
              ),
            ),
          );

        });
  }
}
