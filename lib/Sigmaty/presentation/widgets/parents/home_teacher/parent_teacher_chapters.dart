import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

import 'widgets/teacher_chapters/teacher_chapters_list.dart';

class TeacherChapters extends StatefulWidget {
  const TeacherChapters(
      {super.key, required this.user, required this.data, required this.index});
  final dynamic data;
  final User? user;
  final int index;

  @override
  State<TeacherChapters> createState() => _TeacherChaptersState();
}

class _TeacherChaptersState extends State<TeacherChapters> {
  final fireStore = FirebaseFirestore.instance;

  late String uid;
  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot> documents = widget.data.docs;
    List<Map> items = documents.map((e) => e.data() as Map).toList();
    Map thisItem = items[widget.index];
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 2,
        title: Text(
          'الاستاذ: ${thisItem['name']}',
          style: FontAsset.font20WeightSemiBold,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: fireStore
                  .collection('teacher')
                  .doc(thisItem['name'])
                  .collection('chapters')
                  .snapshots(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? chapterRow(snapshot.data, thisItem['name'])
                    : snapshot.hasError
                    ? Text('Error')
                    : Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }

  Widget chapterRow(dynamic data, String teacherName){
    List<QueryDocumentSnapshot> documents = data.docs;
    List<Map> items = documents.map((e) => e.data() as Map).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'الفصل/الشابتر',
              style: FontAsset.font16WeightSemiBold,
            ),
            Text(
              '(${items.length})',
              style: FontAsset.font16WeightSemiBold,
            ),
          ],
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.02,
        ),
        TeacherChaptersList(data: data, teacherName: teacherName, index: widget.index,)
      ],
    );
  }
}
