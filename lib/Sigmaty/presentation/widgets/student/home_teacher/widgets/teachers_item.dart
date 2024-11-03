import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/teacher_profile.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/teacher_subjects.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants/assets_data.dart';
import '../../../../../constants/colors_asset.dart';
import '../../../../../constants/screen_size.dart';
import '../../../customizations/customize_teacher_image/customize_teacher_image.dart';
import '../../../customizations/customize_teacher_image/customize_teacher_image_sec.dart';
import 'choose_subject_type.dart';
import 'dropdown_teacher.dart';

class TeachersItem extends StatefulWidget {
  const TeachersItem({
    super.key,
    required this.controller,
    required this.user,
  });


  final PageController controller;
  final User? user;

  @override
  State<TeachersItem> createState() => _TeachersItemState();
}

class _TeachersItemState extends State<TeachersItem> {
  final fireStore = FirebaseFirestore.instance;
  late String? uid;

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
        StreamBuilder<QuerySnapshot>(
            stream: fireStore.collection('teacher').snapshots(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? pageViewTeacher(snapshot.data)
                  : snapshot.hasError
                      ? Text('Error')
                      : Center(child: CircularProgressIndicator());
            }),
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
        StreamBuilder<QuerySnapshot>(
            stream: fireStore.collection('teacher').snapshots(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? gridViewTeacher(snapshot.data)
                  : snapshot.hasError
                      ? Text('Error')
                      : Center(child: CircularProgressIndicator());
            }),
      ],
    );
  }

  Widget pageViewTeacher(dynamic data) {
    List<QueryDocumentSnapshot> documents = data.docs;
    List<Map> items = documents.map((e) => e.data() as Map).toList();

    return Column(
      children: [
        SizedBox(
          height: ScreenSize.height(context) * 0.4,
          width: ScreenSize.width(context),
          child: PageView.builder(
              controller: widget.controller,
              itemCount: items.length,
              itemBuilder: (context, index) {
                Map thisItem = items[index];
                List<String> academicYearList =
                    List<String>.from(thisItem['academicYear']);
                String academicYearString = academicYearList.join(', ');
                return CustomizeTeacherImage(
                  imageUrl: AssetsData.person,
                  subjectName: thisItem['subject'],
                  teacherName: thisItem['name'],
                  yearOfSecondary: '${academicYearString}',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherProfile(data: data, index: index, user: widget.user)));
                  },
                );
              }),
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: SmoothPageIndicator(
            controller: widget.controller,
            count: items.length,
            effect: ExpandingDotsEffect(
                activeDotColor: ColorsAsset.mainColor,
                dotColor: ColorsAsset.mainColor.withOpacity(0.2),
                dotHeight: 8,
                dotWidth: 16),
          ),
        ),
      ],
    );
  }

  Widget gridViewTeacher(dynamic data) {
    List<QueryDocumentSnapshot> documents = data.docs;
    List<Map> items = documents.map((e) => e.data() as Map).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      // padding around the grid
      itemCount: items.length,
      // total number of items
      itemBuilder: (context, index) {
        Map thisItem = items[index];
        List<String> academicYearList = List<String>.from(thisItem['academicYear']);
        String academicYearString = academicYearList.join(', ');
        return CustomizeTeacherImageSec(
          imageUrl: AssetsData.person,
          subjectName: thisItem['subject'],
          teacherName: thisItem['name'],
          yearOfSecondary: '${academicYearString}',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TeacherProfile(data: data,index: index, user: widget.user)));
          },
        );
      },
    );
  }
}
