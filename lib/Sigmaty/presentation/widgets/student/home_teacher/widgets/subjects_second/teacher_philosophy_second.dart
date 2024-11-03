import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/customization_subject/customize_subject.dart';

import '../../../../customizations/customization_subject/customize_subject_second.dart';

class TeacherPhilosophySecond extends StatelessWidget {
  const TeacherPhilosophySecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
        child:  GestureDetector(
            onTap: (){},
            child: const CustomizeSubjectSecond(imageUrl: AssetsData.philosophy, txtSubject: 'فلسفة', txtNumberOfTeacher: '',)));
  }
}
