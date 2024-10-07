import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/customize_teacher_profile/customize_teacher_profile.dart';

import '../../../parents/home_teacher/parent_teacher_chapters.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomizeTeacherProfile(
      teacherName: 'الاستاذ: محمد سعد',
      subjectName: 'فيزياء',
      courseName: 'كورس شرح الترم الثاني',
      bio: '''الاستاذ محمد سعد خبرة 13 سنة في تدريس مادة الفيزياء 
وحاصل على شهادات الماجستير و الدكتوراة في علم الفيزياء
من افضل 5 معلمين على مستوى الجمهورية''',
      followOnPressed: () {},
      lectureOnPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherChapters()));
      },
      materialOnPressed: () {},
      bookingOnPressed: () {},
      secondaryYear: 'الصف الثالث ثانوي',
      imageUrl: AssetsData.person,
    ));
  }
}
