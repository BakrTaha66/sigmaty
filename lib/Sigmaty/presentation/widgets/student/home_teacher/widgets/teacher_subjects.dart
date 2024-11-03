import 'package:flutter/material.dart';
import 'subjects/teacher_arabic.dart';
import 'subjects/teacher_autism.dart';
import 'subjects/teacher_dna.dart';
import 'subjects/teacher_english.dart';
import 'subjects/teacher_france.dart';
import 'subjects/teacher_history.dart';
import 'subjects/teacher_italic.dart';
import 'subjects/teacher_maths.dart';
import 'subjects/teacher_philosophy.dart';
import 'subjects/teacher_physics.dart';
import 'subjects/teacher_chemical.dart';
import 'subjects/teacher_spain.dart';

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
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  TeacherChemical(),
                  SizedBox(width: 8,),
                  TeacherMaths(),
                  SizedBox(width: 8,),
                  TeacherArabic(),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TeacherDNA(),
                  SizedBox(width: 8,),
                  TeacherPhysics(),
                  SizedBox(width: 8,),
                  TeacherEnglish(),
                ],
              ),
            ],
          ),
          SizedBox(width: 8,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TeacherPhilosophy(),
                  SizedBox(width: 8,),
                  TeacherHistory(),
                  SizedBox(width: 8,),
                  TeacherFrance(),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TeacherAutism(),
                  SizedBox(width: 8,),
                  TeacherItalic(),
                  SizedBox(width: 8,),
                  TeacherSpain(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}












