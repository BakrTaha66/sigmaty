import 'package:flutter/material.dart';

import 'widgets/student_partition_teacher.dart';

class StudentPartitionViewBody extends StatelessWidget {
  const StudentPartitionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: StudentPartitionTeacher(),
        ));
  }
}
