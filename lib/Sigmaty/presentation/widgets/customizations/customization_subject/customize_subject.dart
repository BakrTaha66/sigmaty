import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class CustomizeSubject extends StatelessWidget {
  const CustomizeSubject({
    super.key,
    required this.imageUrl,
    required this.txtSubject,
    required this.txtNumberOfTeacher,
  });

  final String imageUrl;
  final String txtSubject;
  final String txtNumberOfTeacher;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 124,
          width: 124,
          child: Image.asset(
            imageUrl,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txtSubject,
              style: FontAsset.font20WeightSemiBold
                  .copyWith(color: ColorsAsset.secondaryColor),
            ),
            Text(txtNumberOfTeacher,
                style: FontAsset.font14WeightSemiBold
                    .copyWith(color: ColorsAsset.secondaryColor)),
          ],
        )
      ],
    );
  }
}
