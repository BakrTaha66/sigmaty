import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/teacher_subjects.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/teachers_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants/colors_asset.dart';
import '../../../../../constants/screen_size.dart';
import 'best_teacher_image.dart';
import 'choose_subject_type.dart';
import 'dropdown_teacher.dart';

class TeachersItem extends StatelessWidget {
  const TeachersItem({
    super.key,
    required this.pages,
    required this.controller,
  });

  final List<BestTeacherImage> pages;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مدرسين النخبة',
          style: FontAsset.font20WeightSemiBold,
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.4,
          width: ScreenSize.width(context),
          child: PageView.builder(
            controller: controller,
              itemBuilder: (context, index) {
                return pages[index % pages.length];
          }),
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: ExpandingDotsEffect(
                activeDotColor: ColorsAsset.mainColor,
                dotColor: ColorsAsset.mainColor.withOpacity(0.2),
                dotHeight: 8,
                dotWidth: 16),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        const ChooseSubjectType(),
        SizedBox(
          height: 8,
        ),
        const DropdownTeacher(),
        SizedBox(
          height: 16,
        ),
        const TeacherSubjects(),
        SizedBox(
          height: 16,
        ),
        const ChooseSubjectType(),
        SizedBox(
          height: 8,
        ),
        const DropdownTeacher(),
        SizedBox(
          height: 16,
        ),
        const TeachersList()
      ],
    );
  }
}
