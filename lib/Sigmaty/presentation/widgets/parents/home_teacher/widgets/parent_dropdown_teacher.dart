import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';

class ParentDropdownTeacher extends StatefulWidget {
  const ParentDropdownTeacher({super.key});

  @override
  State<ParentDropdownTeacher> createState() => _ParentDropdownTeacherState();
}

class _ParentDropdownTeacherState extends State<ParentDropdownTeacher> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return               DropdownButtonFormField<String>(
      dropdownColor: ColorsAsset.mainColor.withOpacity(0.8),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        fillColor: ColorsAsset.mainColor,
        filled: true,
      ),
      hint: Text(
        'الصف',
        style: FontAsset.font12WeightMedium.copyWith(
            color: ColorsAsset.secondaryColor,
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
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: FontAsset.font12WeightMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorsAsset.secondaryColor),
          ),
        );
      }).toList(),
    );

  }
}
