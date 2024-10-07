import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_dropdown_app/custom_dropdown_app.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/teacher_home/widgets/teacher_chapter_list.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/teacher_home/widgets/teacher_videos_list.dart';

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
  bool isFirstIconVisible = true; // للتحكم في التبديل بين الأيقونات
  bool isSecondIconVisible = true;
  bool isFirstButtonVisible = true; // التحكم في التبديل بين الأزرار
// للتحكم في التبديل بين الأيقونات


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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                height: 16,
              ),
              // Divider
              Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6,
              ),
              SizedBox(
                height: 16,
              ),

              // Add Chapter Section
              InkWell(
                onTap: () {
                  setState(() {
                    isFirstIconVisible =
                        !isFirstIconVisible; // تبديل الأيقونة عند الضغط
                    isMenu2Visible = !isMenu2Visible; // إظهار أو إخفاء القائمة
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اضافة فصل/شابتر جديد",
                      style: FontAsset.font16WeightSemiBold,
                    ),
                    // الأيقونة التي سيتم تغييرها عند الضغط على الـ Row بالكامل
                    Icon(
                      isFirstIconVisible
                          ? Icons.arrow_forward_ios // الأيقونة الأولى
                          : Icons.arrow_drop_down, // الأيقونة الثانية
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isMenu2Visible,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
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
                      SizedBox(height: 16),
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
                      SizedBox(height: 16),
                      CustomDropdownApp(
                        items: const ["10", "20", "30", "40", "50"],
                        hintText: "عدد الحصص",
                        onChanged: (val) {
                          print(val);
                        },
                      ),
                      SizedBox(height: 16),
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
                      SizedBox(height: 16),
                      isFirstButtonVisible
                          ? ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(double.infinity, 40),
                              ),
                              onPressed: () {
                                setState(() {
                                  isFirstButtonVisible =
                                      false; // إخفاء الزر الأول
                                });
                                // فتح الـ Modal Bottom Sheet
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled:
                                      true, // للسماح بالتحكم في الحجم
                                  builder: (context) {
                                    return Container(
                                      height: 650.0,
                                      width: ScreenSize.width(
                                          context), // هنا يمكنك التحكم في الارتفاع
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              minimumSize: const Size(
                                                  double.infinity, 40),
                                            ),
                                            onPressed: () {
                                              pickVideo();
                                            },
                                            label: const Text(
                                              "اختر فيديو الحصة",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            icon: const Icon(
                                              Icons.video_collection_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: CustomDropdownApp(
                                              items: const [
                                                "عدد المرات",
                                                "عدد الايام",
                                              ],
                                              hintText: "صلاحية المشاهدة",
                                              onChanged: (val) {
                                                print(val);
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: CustomDropdownApp(
                                              items: const [
                                                "0",
                                                "1",
                                                "2",
                                                "3",
                                                "4",
                                                "5",
                                                "6",
                                                "7"
                                              ],
                                              hintText: "0",
                                              onChanged: (val) {
                                                print(val);
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              minimumSize: const Size(
                                                  double.infinity, 40),
                                            ),
                                            onPressed: () {
                                              // تنفيذ الحفظ
                                            },
                                            label: const Text(
                                              "حفظ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              label: const Text(
                                "رفع الفيديو",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              icon: const Icon(
                                Icons.upgrade_outlined,
                                color: Colors.white,
                              ),
                            )
                          : ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(double.infinity, 40),
                              ),
                              onPressed: () {
                                setState(() {
                                  isFirstButtonVisible =
                                      true; // العودة للزر الأول
                                });
                              },
                              label: const Text(
                                "تم رفع 4 فيديوهات",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // icon محذوف لتغيير شكل الزر الثاني
                            ),
                      SizedBox(height: 16),
                      TeacherVideosList(),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          backgroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        onPressed: () {},
                        label: const Text(
                          "اضافة الشابتر",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        // icon محذوف لتغيير شكل الزر الثاني
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Divider
              Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6,
              ),
              SizedBox(height: 16),
              // Add Student Section
              InkWell(
                onTap: () {
                  setState(() {
                    isSecondIconVisible =
                        !isSecondIconVisible; // تبديل الأيقونة عند الضغط
                    isMenu3Visible = !isMenu3Visible; // إظهار أو إخفاء القائمة
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اضافة طالب ",
                      style: FontAsset.font16WeightSemiBold,
                    ),
                    // الأيقونة التي سيتم تغييرها عند الضغط على الـ Row بالكامل
                    Icon(
                      isSecondIconVisible
                          ? Icons.arrow_forward_ios // الأيقونة الأولى
                          : Icons.arrow_drop_down, // الأيقونة الثانية
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isMenu3Visible,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
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
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Divider
              Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6,
              ),
              SizedBox(height: 16),
              // TeacherChapterList()
            ],
          ),
        ),
      ),
    );
  }
}
