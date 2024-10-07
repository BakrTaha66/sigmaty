import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'widgets/begin_and_end_time.dart';
import 'widgets/lessons_details.dart';

class SecondLessonScreenViewBody extends StatelessWidget {
  const SecondLessonScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                '4 حصص',
                style: FontAsset.font16WeightSemiBold,
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                return  const  Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: LessonsDetails(),
                );

              })
            ],
          ),
        ),
      ),
    ));
  }
}

