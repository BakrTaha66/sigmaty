import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

import 'widgets/teacher_chapters/teacher_chapters_list.dart';


class TeacherChapters extends StatelessWidget {
  const TeacherChapters({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'الاستاذ: محمد سعد',
          style: FontAsset.font16WeightSemiBold,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الفصل/الشابتر',
                    style: FontAsset.font16WeightSemiBold,
                  ),
                  Text(
                    '(5) شباتر',
                    style: FontAsset.font16WeightSemiBold,
                  ),
                ],
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
             const  TeacherChaptersList()
            ],
          ),
        ),
      ),
    ));
  }
}

