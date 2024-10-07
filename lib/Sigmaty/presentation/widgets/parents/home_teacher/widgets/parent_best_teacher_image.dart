import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/customize_teacher_image/customize_teacher_image.dart';

class ParentBestTeacherImage extends StatelessWidget {
  const ParentBestTeacherImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomizeTeacherImage(imageUrl: AssetsData.person, subjectName: 'فيزياء', teacherName: 'محمد سعد', yearOfSecondary: 'الصف الثالث الثانوي', onTap: (){

    },);
  }
}
