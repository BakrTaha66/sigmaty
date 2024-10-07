import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class CustomizeSubject extends StatelessWidget {
  const CustomizeSubject(
      {super.key, required this.imageUrl,});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: 104,
      child: Image.asset(
        imageUrl,
      ),
    );
  }
}
