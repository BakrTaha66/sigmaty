import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/customize_teacher_image/customize_teacher_image.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/customize_teacher_image/customize_teacher_image_sec.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/student/home_teacher/widgets/teacher_profile.dart';

class BestTeacherImage extends StatelessWidget {
  const BestTeacherImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomizeTeacherImage(
      imageUrl: AssetsData.person,
      subjectName: 'فيزياء',
      teacherName: 'محمد سعد',
      yearOfSecondary: 'الصف الثالث الثانوي',
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TeacherProfile()));
      },
    );
  }
}

class BestTeacherImageSec extends StatelessWidget {
  const BestTeacherImageSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomizeTeacherImageSec(
        imageUrl: AssetsData.person,
        subjectName: 'فيزياء',
        teacherName: 'محمد سعد',
        yearOfSecondary: 'الصف الثالث الثانوي');
  }
}
