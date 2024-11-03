import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/packages/widgets/package_linear.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../pages/teacher/taecher_home/teacher_home_view.dart';

class PackagesViewBody extends StatefulWidget {
  const PackagesViewBody({super.key, required this.user});
  final User? user;

  @override
  State<PackagesViewBody> createState() => _PackagesViewBodyState();
}

class _PackagesViewBodyState extends State<PackagesViewBody> {

  // whatsapp() async {
  //   String contact = "01090502366";
  //   String text = 'Hello';
  //   String androidUrl = "whatsapp://send?phone=$contact&text=$text";
  //   String iosUrl = "https://wa.me/$contact?text=${Uri.parse(text)}";
  //
  //   String webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=hi';
  //
  //   try {
  //     if (Platform.isIOS) {
  //       if (await canLaunchUrl(Uri.parse(iosUrl))) {
  //         await launchUrl(Uri.parse(iosUrl));
  //       } else{
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('whatsapp no installed')));
  //       }
  //     } else {
  //       if (await canLaunchUrl(Uri.parse(androidUrl))) {
  //         await launchUrl(Uri.parse(androidUrl));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('whatsapp no installed')));
  //       }
  //     }
  //   } catch(e) {
  //     print('object');
  //     await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
  //   }
  // }

  void launchWhatsApp({required String phone, required String message}) async {
    String url = 'whatsapp://send?phone=$phone&text=$message';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List packages = [
      PackageLinear(
          color: const Color(0xffD4B821),
          packageName: 'GOLD',
          onPressed: () {
            // launchWhatsApp(phone: '+201090502366', message: 'Hello');
            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomeView(user: widget.user,)));

          }),
      PackageLinear(
          color: const Color(0xffE7E7E7),
          packageName: 'SILVER',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomeView(user: widget.user,)));
          }),
      PackageLinear(
          color: const Color(0xffD48918),
          packageName: 'BRONZE',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomeView(user: widget.user,)));
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
