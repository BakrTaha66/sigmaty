import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';

import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/customization_subject/customize_subject.dart';

class TeacherHistory extends StatelessWidget {
  const TeacherHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){},
        child: const CustomizeSubject(imageUrl: AssetsData.history,));
  }
}
