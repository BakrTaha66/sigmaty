import 'package:flutter/material.dart';

import '../../../../constants/font_asset.dart';

class CustomInkWell extends StatefulWidget {
  CustomInkWell({super.key, required this.txt, required this.isMenuVisible, required this.isFirstIconVisible});
  String txt;
  bool isFirstIconVisible;
  bool isMenuVisible;


  @override
  State<CustomInkWell> createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isFirstIconVisible = widget.isFirstIconVisible; // تبديل الأيقونة عند الضغط
          widget.isMenuVisible = widget.isMenuVisible; // إظهار أو إخفاء القائمة
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.txt,
            style: FontAsset.font16WeightSemiBold,
          ),
          // الأيقونة التي سيتم تغييرها عند الضغط على الـ Row بالكامل
          Icon(
            widget.isFirstIconVisible
                ? Icons.arrow_forward_ios // الأيقونة الأولى
                : Icons.arrow_drop_down, // الأيقونة الثانية
          ),
        ],
      ),
    );
  }
}

