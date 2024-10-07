import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_arabic.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_autism.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_chemical.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_dna.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_france.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_history.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_italic.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_maths.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_philosophy.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_physics.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects/teacher_spain.dart';

import 'widgets/best_teacher_image.dart';
import 'widgets/subjectsItem.dart';
import 'widgets/teachers_item.dart';

class StudentHomeViewBody extends StatefulWidget {
  const StudentHomeViewBody({super.key});

  @override
  State<StudentHomeViewBody> createState() => _StudentHomeViewBodyState();
}

class _StudentHomeViewBodyState extends State<StudentHomeViewBody> {
  TextEditingController searchController = TextEditingController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  bool isSubjects = true;
  bool isTeachers = true;
  @override
  Widget build(BuildContext context) {
    List subjects = const [
      TeacherArabic(),
      TeacherAutism(),
      TeacherChemical(),
      TeacherDNA(),
      TeacherFrance(),
      TeacherHistory(),
      TeacherItalic(),
      TeacherMaths(),
      TeacherPhilosophy(),
      TeacherPhysics(),
      TeacherSpain(),
    ];
    final pages = List.generate(6, (index) => const BestTeacherImage());
    return Scaffold(
      body: SafeArea(
        child : Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        width: ScreenSize.width(context),
                        child: CustomFormField(
                          hintText: 'searchOnTeachers'.tr(),
                          controller: searchController,
                          obscureText: false,
                          borderSideColor: Colors.black.withOpacity(0.2),
                          borderRadius: 8,
                          fontColor: ColorsAsset.hintColor,
                          fillcolor: Colors.white,
                          textStyleColor: Colors.black,
                          fieldSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push("/SearchHomeScreenBody");
                      },
                      child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                              color: ColorsAsset.mainColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SvgPicture.asset(AssetsData.filter),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTeachers = !isTeachers;
                            isSubjects = !isSubjects;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: ScreenSize.width(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: isTeachers
                                ? ColorsAsset.mainColor
                                : ColorsAsset.secondaryColor,
                            border: Border.all(
                                color: isSubjects
                                    ? ColorsAsset.mainColor
                                    : ColorsAsset.mainColor),
                          ),
                          child: Center(
                              child: Text(
                            'المدرسين',
                            style: FontAsset.font14WeightSemiBold.copyWith(
                                color: isTeachers
                                    ? ColorsAsset.secondaryColor
                                    : ColorsAsset.mainColor),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTeachers = !isTeachers;
                            isSubjects = !isSubjects;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: ScreenSize.width(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: isSubjects
                                      ? ColorsAsset.mainColor
                                      : ColorsAsset.secondaryColor),
                              color: isSubjects
                                  ? ColorsAsset.secondaryColor
                                  : ColorsAsset.mainColor),
                          child: Center(
                              child: Text(
                            'المواد',
                            style: FontAsset.font14WeightSemiBold.copyWith(
                                color: isSubjects
                                    ? ColorsAsset.mainColor
                                    : ColorsAsset.secondaryColor),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                isSubjects == true
                    ? TeachersItem(pages: pages, controller: controller)
                    : SubjectsItem(subjects: subjects)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
