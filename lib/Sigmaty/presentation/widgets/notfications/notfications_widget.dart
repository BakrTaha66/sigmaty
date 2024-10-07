import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class NotficationsWidget extends StatelessWidget {
  const NotficationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("الاشعارات", style: FontAsset.font20WeightSemiBold),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 14.0, right: 14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
               ListView.builder(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: 5,
                   itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: buildNotificationContainer(context),
                 );
               })

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNotificationContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        width: ScreenSize.width(context) * 1,
        height: ScreenSize.height(context) * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 0.5, color: Colors.grey),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "الاستاذ : محمد سعد",
                      style: FontAsset.font16WeightSemiBold,
                    ),
                    SizedBox(
                      height: ScreenSize.height(context) * 0.002,
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
                SizedBox(
                  width: ScreenSize.width(context) * 0.02,
                ),
                const CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/images/Rectangle 7.png'),
                ),
              ],
            ),
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Row(
              children: [

                Image.asset(
                  "assets/images/Rectangle 6.png",
                  width: ScreenSize.width(context) * 0.2,
                ),
                SizedBox(width: ScreenSize.width(context) * 0.04),
                Text(
                  'final revisions',
                  style: FontAsset.font16WeightBold,
                ),
              ],
            ),
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.video_library_outlined),
                        SizedBox(width: ScreenSize.width(context) * 0.02),
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
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.menu_rounded),
                    SizedBox(width: ScreenSize.width(context) * 0.02),
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
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              color: Colors.grey,
              height: 0.6,
            ),
            SizedBox(height: ScreenSize.height(context) * 0.02),
            Center(
              child: Text(
                "تمت اضافة شابتر جديد",
                style: FontAsset.font16WeightMedium,
              ),
            ),
            SizedBox(height: ScreenSize.height(context) * 0.02),
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
  }}
