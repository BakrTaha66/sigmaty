import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.title,
      this.iconColor,
      required this.height,
      required this.width,
      required this.onPressed,
      required this.primaryColor,
      required this.secondaryColor,
      required this.fontSize,
      required this.assetPath,
      required this.assetImg,
      required this.iconHeight,
      required this.iconWidth,
        required this.borderColor});

  final String title;
  final double height;
  final double width;
  final void Function() onPressed;
  final Color primaryColor;
  final Color secondaryColor;
  final double fontSize;
  final String assetPath;
  final String assetImg;
  Color? iconColor;
  final double iconHeight;
  final double iconWidth;
final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(25),
          border: Border.all(color: borderColor),
            image: DecorationImage(
                image: AssetImage(assetImg), fit: BoxFit.fill),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    assetPath,
                    height: ScreenSize.height(context) * iconHeight,
                    width: ScreenSize.width(context) * iconWidth,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: fontSize, color: secondaryColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
