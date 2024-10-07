import 'package:flutter/material.dart';
import 'best_teacher_image.dart';

class TeachersList extends StatelessWidget {
  const TeachersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      // padding around the grid
      itemCount: 10,
      // total number of items
      itemBuilder: (context, index) {
        return BestTeacherImageSec();
      },
    );
  }
}
