import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_dropdown_app/custom_dropdown_app.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_form_field/custom_form_field.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_inkwell/custom_inkwell.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/teacher_home/widgets/teacher_chapter_list.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/teacher_home/widgets/teacher_video.dart';
import 'package:sigmaty/Sigmaty/services/database.dart';
import 'package:sigmaty/Sigmaty/services/upload_service.dart';
import 'package:video_player/video_player.dart';

class TeacherHomeViewBody extends StatefulWidget {
  const TeacherHomeViewBody({super.key, required this.user});
  final User? user;

  @override
  State<TeacherHomeViewBody> createState() => _TeacherHomeViewBodyState();
}

class _TeacherHomeViewBodyState extends State<TeacherHomeViewBody> {
  final DatabaseMethods databaseMethods = DatabaseMethods();
  // final UploadService _uploadService = UploadService();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _addChapterController = TextEditingController();
  final TextEditingController _sessionNameController = TextEditingController();
  final MediaUploadService _mediaUploadService = MediaUploadService();

  bool isMenu2Visible = false;
  bool isMenu3Visible = false;
  bool isFirstIconVisible = true; // للتحكم في التبديل بين الأيقونات
  bool isSecondIconVisible = true;
  bool isFirstButtonVisible = true; // التحكم في التبديل بين الأزرار
// للتحكم في التبديل بين الأيقونات


  File? selectedImage;
  File? selectedVideo;


  // Dummy method to return thumbnail path for a video
  // String _getThumbnailPath(File videoFile) {
  //   // Replace this with your logic to get the thumbnail for the video
  //   // For example, if you store thumbnails in the same directory:
  //   return videoFile.path.replaceAll('.mp4', '.jpg'); // Assuming the thumbnail is a jpg with the same name
  // }

  // Function to save text and media locally
  // void saveTextImageVideo() {
  //   _mediaUploadService.saveTextImageVideo(
  //     sessionName: _sessionNameController.text,
  //     selectedImage: selectedImage,
  //     selectedVideo: selectedVideo,
  //   );
  //   setState(() {
  //     _sessionNameController.clear();
  //     selectedImage = null;
  //     selectedVideo = null;
  //   });
  //     Navigator.pop(context);
  // }

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
                  controller: _searchController,
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
                          controller: _addChapterController,
                          obscureText: false,
                          borderSideColor: Colors.grey,
                          borderRadius: 10.0,
                          fontColor: Colors.grey,
                          fillcolor: Colors.white,
                          textStyleColor: Colors.grey,
                          fieldSize: 14.0),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () async {
                          // await _uploadService
                          //     .pickImage(); // Button to save image locally
                          // setState(
                          //     () {}); // Refresh UI to show image status
                          _mediaUploadService.pickImageChapter();
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.add),
                            const SizedBox(width: 8.0),
                            Text(
                              "اضافة صورة الشابتر",
                              style: FontAsset
                                  .font14WeightSemiBold,
                            ),
                          ],
                        ),
                      ),
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
                                          CustomFormField(
                                              hintText: "اسم الحصة",
                                              controller:
                                                  _sessionNameController,
                                              obscureText: false,
                                              borderSideColor: Colors.grey,
                                              borderRadius: 10.0,
                                              fontColor: Colors.grey,
                                              fillcolor: Colors.white,
                                              textStyleColor: Colors.grey,
                                              fieldSize: 14.0),
                                          SizedBox(height: 16),
                                          InkWell(
                                            onTap: () async {
                                              // await _uploadService
                                              //     .pickImage(); // Button to save image locally
                                              // setState(
                                              //     () {}); // Refresh UI to show image status
                                              _mediaUploadService.pickImage();
                                              setState(() {});
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(Icons.add),
                                                const SizedBox(width: 8.0),
                                                Text(
                                                  "اضافة صورة الحصة",
                                                  style: FontAsset
                                                      .font14WeightSemiBold,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              minimumSize: const Size(
                                                  double.infinity, 40),
                                            ),
                                            onPressed: () async {
                                              // await _uploadService.pickVideo();
                                              // setState(
                                              //     () {}); // Update UI after picking the video
                                              _mediaUploadService.pickVideo();
                                              setState(() {});
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
                                          Row(
                                            children: [
                                              Expanded(
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
                                              SizedBox(width: 16),
                                              Expanded(
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
                                            ],
                                          ),
                                          SizedBox(height: 16),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              minimumSize: const Size(
                                                  double.infinity, 40),
                                            ),
                                            onPressed: () {
                                              _mediaUploadService.saveTextImageVideo(
                                                sessionName: _sessionNameController.text
                                              );
                                              setState(() {
                                                _sessionNameController.clear();
                                              });
                                              Navigator.pop(
                                                  context); // Refresh UI to show video count
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
                              label: _mediaUploadService.savedItems.isNotEmpty
                                  ? Text(
                                      " تم رفع ${_mediaUploadService.savedItems.length} حصص ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "لم يتم الرفع",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                              // icon محذوف لتغيير شكل الزر الثاني
                              ),
                      SizedBox(
                          child: _mediaUploadService.savedItems.isNotEmpty
                              ? Expanded(
                                  child: ListView. builder(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      itemCount:
                                      _mediaUploadService.savedItems.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        // File videoFile =
                                        //     _uploadService.savedVideos[index];
                                        // File imageFile =
                                        // _uploadService.savedImages[index];
                                        selectedVideo = _mediaUploadService.savedItems[index]['video'];
                                        selectedImage = _mediaUploadService.savedItems[index]['image'];
                                        String sessionName = _mediaUploadService.savedItems[index]['sessionName'];
                                        return TeacherVideo(selectedVideo: selectedVideo, selectedImage: selectedImage, sessionName: sessionName,);
                                      }),
                                )
                              : Center(child: Text("في انتظار رفع الفيديوهات", style: TextStyle(
                            color: Colors.redAccent
                          ),))),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          backgroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        onPressed: () async {
                          await _mediaUploadService.uploadToFirestore(
                                widget.user!.displayName!,
                                _addChapterController.text,
                          );
                          // await _uploadService.uploadMedia(
                          //     widget.user!.displayName!,
                          //     _addChapterController.text,
                          //     _sessionNameController
                          //         .text); // Button to upload both image and videos
                          setState(() {
                            _addChapterController.clear();
                          }); // Clear UI after upload
                        },
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
                      "اضافة طالب",
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

  // @override
  // void dispose() {
  //   // Dispose all the video controllers when the widget is disposed
  //   _uploadService.disposeControllers();
  //   super.dispose();
  // }
}
