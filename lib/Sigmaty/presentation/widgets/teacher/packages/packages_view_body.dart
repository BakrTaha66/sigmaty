import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/packages/widgets/package_linear.dart';

import '../../../pages/teacher/taecher_home/teacher_home_view.dart';

class PackagesViewBody extends StatelessWidget {
  const PackagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List packages = [
      PackageLinear(
          color: const Color(0xffD4B821),
          packageName: 'GOLD',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomeView()));
          }),
      PackageLinear(
          color: const Color(0xffE7E7E7),
          packageName: 'SILVER',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomeView()));
          }),
      PackageLinear(
          color: const Color(0xffD48918),
          packageName: 'BRONZE',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomeView()));
          }),
    ];
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الباقات',
                style: FontAsset.font20WeightSemiBold,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'يرجى الاشتراك لرفع المحاضرات واضافة المحتوى التعليمي اختر الباقة المناسبة',
                style: FontAsset.font16WeightSemiBold,
              ),
              SizedBox(
                height: 24,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: packages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: packages[index],
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
