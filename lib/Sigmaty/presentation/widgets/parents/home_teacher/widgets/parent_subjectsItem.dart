import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

import 'parent_choose_subject_type.dart';
import 'parent_dropdown_teacher.dart';

class ParentSubjectsitem extends StatelessWidget {
  const ParentSubjectsitem({
    super.key,
    required this.subjects,
  });

  final List subjects;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const  ParentChooseSubjectType(),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        const  ParentDropdownTeacher(),
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
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: subjects.length, // total number of items
          itemBuilder: (context, index) {
            return subjects[index];
          },
        )
      ],
    );
  }
}
