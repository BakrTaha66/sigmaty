import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class TeacherChaptersList extends StatelessWidget {
  const TeacherChaptersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
               context.push("/SessionsScreenBody");
              },
              child: Container(
                height: ScreenSize.height(context) * 0.15,
                width: ScreenSize.width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage(AssetsData.revision), fit: BoxFit.fill),
                ),
                child: Container(
                  height: ScreenSize.height(context) * 0.15,
                  width: ScreenSize.width(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff249EF1),
                            Colors.black.withOpacity(0.25),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'revisions',
                          style: FontAsset.font20WeightSemiBold.copyWith(
                              color: ColorsAsset.secondaryColor, fontSize: 24),
                        ),
                        Text(
                          '3 محاضرات',
                          style: FontAsset.font20WeightSemiBold.copyWith(
                              color: ColorsAsset.secondaryColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
