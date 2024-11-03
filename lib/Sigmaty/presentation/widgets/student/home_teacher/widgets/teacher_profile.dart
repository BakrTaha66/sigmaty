import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/customize_teacher_profile/customize_teacher_profile.dart';

import '../../../parents/home_teacher/parent_teacher_chapters.dart';

class TeacherProfile extends StatefulWidget {
  TeacherProfile({super.key, required this.data, required this.index, required this.user});
  dynamic data;
  int index;
  User? user;

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {


  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot> documents = widget.data.docs;
    List<Map> items = documents.map((e) => e.data() as Map).toList();
    Map thisItem = items[widget.index];
    List<String> academicYearList =
    List<String>.from(thisItem['academicYear']);
    String academicYearString = academicYearList.join(', ');

    return CustomizeTeacherProfile(
          teacherName: thisItem['name'],
          subjectName: thisItem['subject'],
          courseName: 'كورس شرح الترم الثاني',
          bio: '''الاستاذ محمد سعد خبرة 13 سنة في تدريس مادة الفيزياء 
    وحاصل على شهادات الماجستير و الدكتوراة في علم الفيزياء
    من افضل 5 معلمين على مستوى الجمهورية''',
          followOnPressed: () {},
          lectureOnPressed: () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TeacherChapters(user: widget.user, data: widget.data, index: widget.index,)));
          },
          materialOnPressed: () {},
          bookingOnPressed: () {},
          secondaryYear: ' الصف : $academicYearString',
          imageUrl: AssetsData.person,
        );
  }
}
