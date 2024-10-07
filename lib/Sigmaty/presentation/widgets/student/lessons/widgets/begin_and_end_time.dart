import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class BeginAndEndTime extends StatelessWidget {
  const BeginAndEndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تبدأ',style: FontAsset.font12WeightMedium,),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  Icon(Icons.calendar_month_rounded,color: Colors.black,),
                  SizedBox(
                    width: 4,
                  ),
                  Text('6/30/2024 ',style: FontAsset.font12WeightMedium,),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  Icon(Icons.access_time_outlined,color: Colors.black,),
                  SizedBox(
                    width: 4,
                  ),
                  Text('9:00 مساء ',style: FontAsset.font12WeightMedium,),
                ],
              ),
            ],
          ),
          Container(
            height: ScreenSize.height(context) * 0.09,
            width: 1,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تنتهي',style: FontAsset.font12WeightMedium,),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  Icon(Icons.calendar_month_rounded,color: Colors.black,),
                  SizedBox(
                    width: 4,
                  ),
                  Text('6/30/2024 ',style: FontAsset.font12WeightMedium,),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  Icon(Icons.access_time_outlined,color: Colors.black,),
                  SizedBox(
                    width: 4,
                  ),
                  Text('9:00 مساء ',style: FontAsset.font12WeightMedium,),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
