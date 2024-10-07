import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_arabic.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_dna.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_chemical.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_english.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_france.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_maths.dart';

import 'parent_degrees.dart';
import 'parent_subject_degree.dart';
import 'top_bar_parent_account_detail.dart';

class ParentAccountDetail extends StatelessWidget {
  const ParentAccountDetail({super.key});

  @override
  Widget build(BuildContext context) {
    List subjects = [
     const TeacherArabic(),
      const TeacherChemical(),
      const  TeacherDNA(),
      const  TeacherEnglish(),
      const TeacherFrance(),
      const TeacherMaths(),
    ];

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsAsset.mainColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorsAsset.secondaryColor,
              )),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const TopBarParentAccountDetail(),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المواد الدراسية',
                  style: FontAsset.font16WeightSemiBold,
                ),
                SizedBox(
                  height: ScreenSize.height(context) * 0.02,
                ),
                ParentSubjectDegree(subjects: subjects)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الدرجات',
                    style: FontAsset.font16WeightSemiBold,
                  ),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
                  ),
                 const ParentDegrees()
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

