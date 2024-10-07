import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';


class CustomButtonWithoutIcon extends StatelessWidget {
  const CustomButtonWithoutIcon({super.key, required this.title, required this.height, required this.width, required this.onPressed, required this.primaryColor, required this.secondaryColor, required this.fontSize, required this.borderColor});
  final String title;
  final double height;
  final double width;
  final void Function() onPressed;
  final Color primaryColor;
  final Color secondaryColor;
  final Color borderColor;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(25),
          border: Border.all(color:borderColor )),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: fontSize, color: secondaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
