import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_dropdown_app/custom_dropdown_app.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';

class SearchHomeScreenBody extends StatefulWidget {
  SearchHomeScreenBody({super.key});

  @override
  State<SearchHomeScreenBody> createState() => _SearchHomeScreenBodyState();
}

class _SearchHomeScreenBodyState extends State<SearchHomeScreenBody> {
  final TextEditingController _searchcontroller = TextEditingController();
  bool isSubjects = true;
  bool isTeachers = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomFormField(
                hintText: 'بحث عن مدرسين',
                controller: _searchcontroller,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                obscureText: false,
                borderSideColor: Colors.black.withOpacity(0.2),
                borderRadius: 8,
                fontColor: ColorsAsset.hintColor,
                fillcolor: Colors.white,
                textStyleColor: ColorsAsset.hintColor,
                fieldSize: 14,
                labelText: '',
                labelFontColor: ColorsAsset.hintColor),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _showMyDialog(context);
                    setState(() {
                      isTeachers = !isTeachers;
                      isSubjects = !isSubjects;
                    });
                  },
                  child: Container(
                    height: ScreenSize.height(context) * 0.07,
                    width: ScreenSize.width(context) * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: isTeachers
                          ? ColorsAsset.mainColor
                          : ColorsAsset.secondaryColor,
                      border: Border.all(
                          color: isSubjects
                              ? ColorsAsset.mainColor
                              : ColorsAsset.mainColor),
                    ),
                    child: Center(
                        child: Text(
                      'المدرسين',
                      style: FontAsset.font14WeightSemiBold.copyWith(
                          color: isTeachers
                              ? ColorsAsset.secondaryColor
                              : ColorsAsset.mainColor),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showMyDialog(context);
                      isTeachers = !isTeachers;
                      isSubjects = !isSubjects;
                    });
                  },
                  child: Container(
                    height: ScreenSize.height(context) * 0.07,
                    width: ScreenSize.width(context) * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: isSubjects
                                ? ColorsAsset.mainColor
                                : ColorsAsset.secondaryColor),
                        color: isSubjects
                            ? ColorsAsset.secondaryColor
                            : ColorsAsset.mainColor),
                    child: Center(
                        child: Text(
                      'المواد',
                      style: FontAsset.font14WeightSemiBold.copyWith(
                          color: isSubjects
                              ? ColorsAsset.mainColor
                              : ColorsAsset.secondaryColor),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "مدرسين النخبة",
                  style: FontAsset.font16WeightSemiBold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap button
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 180.0),
        child: AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(right: 250.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close)),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  CustomDropdownApp(
                    items: const ["10", "12", "14", "16", "18", "20"],
                    hintText: 'المادة',
                    onChanged: (val) {
                     print(val);
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
                  ),
                  CustomDropdownApp(
                    items: const ["10", "12", "14", "16", "18", "20"],
                    hintText: 'القسم',
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
                  ),
                  CustomDropdownApp(
                    items: const ["10", "12", "14", "16", "18", "20"],
                    hintText: 'السنة الدراسية ',
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            CustomButtonWithoutIcon(
              borderColor: Colors.white,
              title: "بحث",
              height: 0.06,
              width: 0.5,
              onPressed: () {
                Navigator.of(context).pop();
              },
              primaryColor: Colors.blue,
              secondaryColor: Colors.white,
              fontSize: 16.0,
            )
          ],
        ),
      );
    },
  );
}
