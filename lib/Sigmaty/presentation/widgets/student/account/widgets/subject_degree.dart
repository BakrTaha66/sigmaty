import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class SubjectDegree extends StatelessWidget {
  const SubjectDegree({
    super.key,
    required this.subjects,
  });

  final List subjects;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height(context)*0.3,
      width: ScreenSize.width(context),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  subjects[index],
                  Text(
                    '60%',
                    style: FontAsset.font20WeightSemiBold.copyWith(
                        color: const Color(0xffFF9519),
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            );
          }),
    );
  }
}
