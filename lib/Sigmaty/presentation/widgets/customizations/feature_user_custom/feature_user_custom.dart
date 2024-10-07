import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class FeatureUserCustom extends StatelessWidget {
  const FeatureUserCustom({
    super.key,
    required this.featureImage,
    required this.onTap,
  });
  final String featureImage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 164,
        width: 164,
        child: Image.asset(
          featureImage,
        ),
      ),
    );
  }
}
