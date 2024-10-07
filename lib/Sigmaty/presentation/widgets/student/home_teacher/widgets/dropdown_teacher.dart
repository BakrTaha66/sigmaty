import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';

class DropdownTeacher extends StatefulWidget {
  const DropdownTeacher({super.key});

  @override
  State<DropdownTeacher> createState() => _DropdownTeacherState();
}

class _DropdownTeacherState extends State<DropdownTeacher> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: DropdownButtonFormField<String>(
        dropdownColor: ColorsAsset.secondaryColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none
          ),
          fillColor: ColorsAsset.mainColor.withOpacity(0.1),
          filled: true,
        ),
        hint: Text(
          'الصف',
          style: FontAsset.font12WeightMedium.copyWith(
              color: ColorsAsset.mainColor,
              fontWeight: FontWeight.w600),
        ),
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'الاول الثانوي',
          'الثاني الثانوي',
          'الثالث الثانوي'
        ].map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            alignment: AlignmentDirectional.center,
            value: value,
            child: Text(
              value,
              style: FontAsset.font12WeightMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorsAsset.mainColor),
            ),
          );
        }).toList(),
      ),
    );

  }
}
