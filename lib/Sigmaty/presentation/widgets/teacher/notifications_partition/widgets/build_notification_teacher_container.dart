import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class BuildNotificationTeacherContainer{
  static   Widget buildNotificationContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: ScreenSize.width(context),
        height: ScreenSize.height(context) * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(width: 0.5, color: Colors.grey),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/Rectangle 7.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    Text(
                      "الاستاذ : محمد سعد",
                      style: FontAsset.font16WeightSemiBold,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Text(
                        "فيزياء",
                        style: FontAsset.font16WeightSemiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/Rectangle 6.png",),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'final revisions',
                  style: FontAsset.font16WeightBold,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.video_library_outlined),
                        SizedBox(width: 8),
                        Text(
                          "فيديوهات",
                          style: FontAsset.font16WeightSemiBold,
                        ),
                      ],
                    ),

                    Text(
                      "4",
                      style: FontAsset.font16WeightSemiBold,
                    ),

                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.menu_rounded),
                    SizedBox(width: 8),
                    Text(
                      "الاسئلة",
                      style: FontAsset.font16WeightSemiBold,
                    ),
                  ],
                ),
                Text(
                  "0",
                  style: FontAsset.font16WeightSemiBold,
                ),


              ],
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "تمت اضافة شابتر جديد",
                style: FontAsset.font16WeightMedium,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.only(right: 120.0, left: 120.0),
                ),
                onPressed: () {},
                child: const Text(
                  'دخول',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}