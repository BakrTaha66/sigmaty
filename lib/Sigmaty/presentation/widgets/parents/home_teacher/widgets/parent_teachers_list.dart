import 'package:flutter/material.dart';
import 'parent_best_teacher_image.dart';

class ParentTeachersList extends StatelessWidget {
  const ParentTeachersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
      ),
      padding:const EdgeInsets.all(8.0),
      // padding around the grid
      itemCount: 10,
      // total number of items
      itemBuilder: (context, index) {
        return const Padding(
          padding:  EdgeInsets.all(8.0),
          child: ParentBestTeacherImage(),
        );
      },
    );
  }
}
