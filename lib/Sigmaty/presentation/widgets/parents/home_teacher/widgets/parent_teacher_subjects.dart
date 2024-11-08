import 'package:flutter/material.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_arabic.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_autism.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_chemical.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_dna.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_english.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_france.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_history.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_italic.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_maths.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_philosophy.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_physics.dart';
import '../../../student/home_teacher/widgets/subjects/teacher_spain.dart';


class TeacherSubjects extends StatelessWidget {
  const TeacherSubjects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherChemical(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherMaths(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherArabic(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherDNA(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherPhysics(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherEnglish(),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherPhilosophy(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherHistory(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherFrance(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherAutism(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherItalic(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TeacherSpain(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}












