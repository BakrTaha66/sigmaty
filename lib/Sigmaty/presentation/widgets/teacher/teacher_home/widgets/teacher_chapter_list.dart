import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

import '../../../../../constants/assets_data.dart';
import 'teacher_chapter_container.dart';

class TeacherChapterList extends StatelessWidget {
  const TeacherChapterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'الفصل/الشابتر (4)',
          style: FontAsset.font20WeightSemiBold,
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return TeacherChapterContainer(
                lessonPic: AssetsData.revision,
                lessonName: 'final revision',
                enterPressed: () {},
                addLessonPressed: () {},);
            })
      ],
    );
  }
}

