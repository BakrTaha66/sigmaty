import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class TeacherVideo extends StatelessWidget {
  const TeacherVideo({
    super.key,
    required this.onTap,
    required this.videoPic,
  });
  final void Function() onTap;
  final String videoPic;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenSize.height(context) * 0.2,
        width: ScreenSize.width(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(videoPic), fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.25),
              const Color(0xff249EF1).withOpacity(0),
              const Color(0xff249EF1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Icon(
              Icons.play_arrow,
              color: ColorsAsset.secondaryColor,
              size: ScreenSize.width(context) * 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
