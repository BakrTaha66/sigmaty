import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/teacher_subjects.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/teachers_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants/colors_asset.dart';
import '../../../../../constants/screen_size.dart';
import 'parent_best_teacher_image.dart';
import 'parent_choose_subject_type.dart';
import 'parent_dropdown_teacher.dart';

class ParentTeachersItem extends StatelessWidget {
  const ParentTeachersItem({
    super.key,
    required this.pages,
    required this.controller,
  });

  final List<ParentBestTeacherImage> pages;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'مدرسين النخبة',
          style: FontAsset.font16WeightSemiBold,
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.4,
          width: ScreenSize.width(context),
          child: PageView.builder(itemBuilder: (context, index) {
            return pages[index % pages.length];
          }),
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: ExpandingDotsEffect(
                activeDotColor: ColorsAsset.mainColor,
                dotColor: ColorsAsset.mainColor.withOpacity(0.2),
                dotHeight: ScreenSize.height(context) * 0.02,
                dotWidth: ScreenSize.width(context) * 0.05),
          ),
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        const ParentChooseSubjectType(),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        const  ParentDropdownTeacher(),
        const TeacherSubjects(),
        const  ParentChooseSubjectType(),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        const  ParentDropdownTeacher(),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        const TeachersList()
      ],
    );
  }
}
