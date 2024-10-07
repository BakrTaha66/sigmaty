import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class ParentBeginAndEndTime extends StatelessWidget {
  const ParentBeginAndEndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تبدأ',style: FontAsset.font12WeightMedium,),
            SizedBox(
              height: ScreenSize.height(context)*0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const  Icon(Icons.calendar_month_rounded,color: Colors.black,),
                SizedBox(
                  width: ScreenSize.width(context)*0.01,
                ),
                Text('6/30/2024 ',style: FontAsset.font12WeightMedium,),
              ],
            ),
            SizedBox(
              width: ScreenSize.width(context)*0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const  Icon(Icons.access_time_outlined,color: Colors.black,),
                SizedBox(
                  width: ScreenSize.width(context)*0.01,
                ),
                Text('9:00 مساء ',style: FontAsset.font12WeightMedium,),
              ],
            ),

          ],
        ),
        SizedBox(
          width: ScreenSize.width(context)*0.2,
        ),
        Container(
          height: ScreenSize.height(context)*0.09,
          width: ScreenSize.width(context)*0.002,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تنتهي',style: FontAsset.font12WeightMedium,),
              SizedBox(
                height: ScreenSize.height(context)*0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  Icon(Icons.calendar_month_rounded,color: Colors.black,),
                  SizedBox(
                    width: ScreenSize.width(context)*0.01,
                  ),
                  Text('6/30/2024 ',style: FontAsset.font12WeightMedium,),
                ],
              ),
              SizedBox(
                width: ScreenSize.width(context)*0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  Icon(Icons.access_time_outlined,color: Colors.black,),
                  SizedBox(
                    width: ScreenSize.width(context)*0.01,
                  ),
                  Text('9:00 مساء ',style: FontAsset.font12WeightMedium,),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
