import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

import 'widgets/parent_best_teacher_image.dart';

import 'widgets/parent_subjectsItem.dart';
import 'widgets/parent_teachers_item.dart';

class ParentHomeViewBody extends StatefulWidget {
  const ParentHomeViewBody({super.key});

  @override
  State<ParentHomeViewBody> createState() => _ParentHomeViewBodyState();
}

class _ParentHomeViewBodyState extends State<ParentHomeViewBody> {
  TextEditingController searchController = TextEditingController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  bool isSubjects=true;
  bool isTeachers=true;
  @override
  Widget build(BuildContext context) {
    List subjects=const [
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
    final pages = List.generate(6, (index) => const ParentBestTeacherImage());
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenSize.height(context) * 0.1,
                    width: ScreenSize.width(context) * 0.8,
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
                  SizedBox(
                    width: ScreenSize.width(context) * 0.02,
                  ),
                  Container(
                      height: ScreenSize.height(context) * 0.07,
                      width: ScreenSize.width(context) * 0.1,
                      decoration: BoxDecoration(
                          color: ColorsAsset.mainColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AssetsData.filter),
                      ))
                ],
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isTeachers=!isTeachers;
                        isSubjects=!isSubjects;
                      });
                    },
                    child: Container(
                      height: ScreenSize.height(context) * 0.07,
                      width: ScreenSize.width(context) * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: isTeachers?ColorsAsset.mainColor:ColorsAsset.secondaryColor,
                        border: Border.all(color: isSubjects?ColorsAsset.mainColor:ColorsAsset.mainColor),
                      ),
                      child: Center(
                          child: Text(
                        'المدرسين',
                        style: FontAsset.font14WeightSemiBold
                            .copyWith(color: isTeachers?ColorsAsset.secondaryColor:ColorsAsset.mainColor),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isTeachers=!isTeachers;
                        isSubjects=!isSubjects;                      });
                    },
                    child: Container(
                      height: ScreenSize.height(context) * 0.07,
                      width: ScreenSize.width(context) * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: isSubjects?ColorsAsset.mainColor:ColorsAsset.secondaryColor),
                          color:isSubjects? ColorsAsset.secondaryColor:ColorsAsset.mainColor),
                      child: Center(
                          child: Text(
                        'المواد',
                        style: FontAsset.font14WeightSemiBold
                            .copyWith(color: isSubjects?ColorsAsset.mainColor:ColorsAsset.secondaryColor),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.03,
              ),
              isSubjects==true?ParentTeachersItem(pages: pages, controller: controller):ParentSubjectsitem(subjects: subjects)
            ],
          ),
        ),
      ),
    ));
  }
}




