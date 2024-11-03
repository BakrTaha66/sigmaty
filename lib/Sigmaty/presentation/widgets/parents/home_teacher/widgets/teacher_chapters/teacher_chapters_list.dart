import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

import '../../../../../pages/chapters_screen/chapters_screen_body.dart';
import '../../../../student/lessons/second_lesson_screen_view_body.dart';

class TeacherChaptersList extends StatefulWidget {
  const TeacherChaptersList({
    super.key,
    required this.data,
    required this.teacherName,
    required this.index,
  });
  final dynamic data;
  final String teacherName;
  final int index;

  @override
  State<TeacherChaptersList> createState() => _TeacherChaptersListState();
}

class _TeacherChaptersListState extends State<TeacherChaptersList> {
  String image = '';

  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot> documents = widget.data.docs;
    List<Map> items = documents.map((e) => e.data() as Map).toList();

    return ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Map chapter = items[index];
          List<dynamic> sessionItem = chapter['items'];
          // String imageUrl = chapter['image'];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SessionsScreenBody(
                              teacherName: widget.teacherName,
                              sessionItem: sessionItem,
                            )));
              },
              child: Container(
                height: 104,
                width: ScreenSize.width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(chapter['imageChapter']),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  height: 104,
                  width: ScreenSize.width(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff249EF1),
                            Colors.black.withOpacity(0.25),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chapter['chapterName'],
                          style: FontAsset.font20WeightSemiBold.copyWith(
                              color: ColorsAsset.secondaryColor, fontSize: 24),
                        ),
                        Text(
                          '${sessionItem.length} محاضرات ',
                          style: FontAsset.font20WeightSemiBold.copyWith(
                              color: ColorsAsset.secondaryColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
