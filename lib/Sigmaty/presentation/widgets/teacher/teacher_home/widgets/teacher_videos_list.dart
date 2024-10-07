import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/teacher_home/widgets/teacher_video.dart';

import '../../../../../constants/assets_data.dart';

class TeacherVideosList extends StatelessWidget {
  const TeacherVideosList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TeacherVideo(
              onTap: () {  },
              videoPic: AssetsData.revision,),
          );
        });
  }
}

