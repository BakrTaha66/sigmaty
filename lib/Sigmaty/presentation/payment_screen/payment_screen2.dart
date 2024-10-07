import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';

import '../../constants/screen_size.dart';

class PaymentScreen2 extends StatelessWidget {
  PaymentScreen2({super.key});
  final TextEditingController _codecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "final revisions - session 1: rafsyuggs",
                style: FontAsset.font16WeightSemiBold,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                  width: ScreenSize.width(context),
                  child: Image.asset("assets/images/Rectangle 6.png",
                    fit: BoxFit.fill,)),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Rectangle 7.png'),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "الاستاذ : محمد سعد",
                          style: FontAsset.font16WeightSemiBold,
                        ),
                        Text(
                          "فيزياء",
                          style: FontAsset.font16WeightSemiBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6, // Line thickness
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
                          SizedBox(
                            width: 8,
                          ),
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey,
                    height: 0.6, // Line thickness
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.menu),
                          SizedBox(
                              width: 8
                          ),
                          Text(
                            "الاسئلة",
                            style: FontAsset.font16WeightSemiBold,
                          ),
                        ],
                      ),
                      Text(
                        "4",
                        style: FontAsset.font16WeightSemiBold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey,
                    height: 0.6, // Line thickness
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.history_rounded),
                      SizedBox(
                          width: 8
                      ),
                      Text(
                        "صلاحية المشاهدة : 7 ايام",
                        style: FontAsset.font16WeightMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 8),
                  Text(
                    "120 ج.م",
                    style: FontAsset.font20WeightSemiBold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                      hintText: "ادخل الكود",
                      controller: _codecontroller,
                      obscureText: false,
                      borderSideColor: Colors.black.withOpacity(0.2),
                      borderRadius: 20.0,
                      fontColor: ColorsAsset.hintColor,
                      fillcolor: Colors.white,
                      textStyleColor: ColorsAsset.hintColor,
                      fieldSize: 12,
                      labelText: "ادخل الكود",
                      labelFontColor: ColorsAsset.hintColor),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 40),
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    onPressed: () {},
                    label: const Text(
                      "افتح الحصة",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

      // SizedBox(
      //           height: ScreenSize.height(context) * 0.01,
      //         ),

      //         SizedBox(
      //           height: ScreenSize.height(context) * 0.01,
      //         ),
          // ElevatedButton.icon(
          //                 style: ElevatedButton.styleFrom(
          //                   backgroundColor: Colors.green,
          //                   minimumSize: Size(double.infinity, 40),
          //                 ),
          //                 onPressed: () {},
          //                 label: const Text(
          //                   "اشتري الان",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 icon: const Icon(
          //                   Icons.call,
          //                   color: Colors.white,
          //                 ),
          //               ),