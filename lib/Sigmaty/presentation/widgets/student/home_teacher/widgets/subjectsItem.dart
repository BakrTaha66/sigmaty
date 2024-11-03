import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_arabic_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_autism_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_chemical_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_dna_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_france_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_history_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_italic_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_maths_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_philosophy_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_physics_second.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/subjects_second/teacher_spain_second.dart';

import 'choose_subject_type.dart';
import 'dropdown_teacher.dart';

class SubjectsItem extends StatelessWidget {
  const SubjectsItem({super.key});

  @override
  Widget build(BuildContext context) {

    List subjects = const [
      TeacherArabicSecond(),
      TeacherAutismSecond(),
      TeacherChemicalSecond(),
      TeacherDNASecond(),
      TeacherFranceSecond(),
      TeacherHistorySecond(),
      TeacherItalicSecond(),
      TeacherMathsSecond(),
      TeacherPhilosophySecond(),
      TeacherPhysicsSecond(),
      TeacherSpainSecond(),
    ];

    return Column(
      children: [
        const  ChooseSubjectType(),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        const  DropdownTeacher(),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          itemCount: subjects.length, // total number of items
          itemBuilder: (context, index) {
            return subjects[index];
          },
        )
      ],
    );
  }
}
