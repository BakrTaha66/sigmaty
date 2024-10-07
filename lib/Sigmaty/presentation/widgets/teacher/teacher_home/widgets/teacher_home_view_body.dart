import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_dropdown_app/custom_dropdown_app.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';

class TeacherHomeViewBody extends StatefulWidget {
  const TeacherHomeViewBody({super.key});

  @override
  State<TeacherHomeViewBody> createState() => _TeacherHomeViewBodyState();
}

class _TeacherHomeViewBodyState extends State<TeacherHomeViewBody> {
  final TextEditingController _search2controller = TextEditingController();
  final TextEditingController _addChaptercontroller = TextEditingController();
  final TextEditingController _sessionNamecontroller = TextEditingController();

  bool isMenu2Visible = false;
  bool isMenu3Visible = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      print('Image Path: ${image.path}');
      // Handle image file here
    }
  }

  Future<void> pickVideo() async {
    final XFile? video = await _picker.pickVideo(
      source: ImageSource.gallery,
    );

    if (video != null) {
      print('Video Path: ${video.path}');
      // Handle video file here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            CustomFormField(
                hintText: 'Search'.tr(),
                controller: _search2controller,
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
                labelText: 'Search'.tr(),
                labelFontColor: ColorsAsset.hintColor),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            // Add Chapter Section
            InkWell(
              onTap: () {
                setState(() {
                  isMenu2Visible = !isMenu2Visible;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اضافة فصل/شابتر جديد",
                      style: FontAsset.font16WeightSemiBold,
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isMenu2Visible,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CustomFormField(
                          hintText: "اكتب اسم الفصل/الشابتر",
                          controller: _addChaptercontroller,
                          obscureText: false,
                          borderSideColor: Colors.grey,
                          borderRadius: 10.0,
                          fontColor: Colors.grey,
                          fillcolor: Colors.white,
                          textStyleColor: Colors.grey,
                          fieldSize: 14.0),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      InkWell(
                        onTap: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.add),
                            const SizedBox(width: 8.0),
                            Text(
                              "اضافة صورة",
                              style: FontAsset.font14WeightSemiBold,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CustomDropdownApp(
                        items: const ["10", "20", "30", "40", "50"],
                        hintText: "عدد الحصص",
                        onChanged: (val) {
                          print(val);
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CustomFormField(
                          hintText: "اسم الحصة",
                          controller: _sessionNamecontroller,
                          obscureText: false,
                          borderSideColor: Colors.grey,
                          borderRadius: 10.0,
                          fontColor: Colors.grey,
                          fillcolor: Colors.white,
                          textStyleColor: Colors.grey,
                          fieldSize: 14.0),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        onPressed: () {
                          pickVideo();
                        },
                        label: const Text(
                          "رفع الفيديو",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        icon: const Icon(
                          Icons.upgrade_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            // Add Student Section
            InkWell(
              onTap: () {
                setState(() {
                  isMenu3Visible = !isMenu3Visible;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اضافة طالب",
                      style: FontAsset.font16WeightSemiBold,
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isMenu3Visible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomDropdownApp(
                    items: const [
                      "طلاب 10",
                      "طلاب 20",
                      "طلاب 30",
                      "طلاب 40",
                      "طلاب 50"
                    ],
                    hintText: "عدد الطلاب",
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    onPressed: () {},
                    label: const Text(
                      "اشتري الان",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
