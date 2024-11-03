import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:sigmaty/Sigmaty/services/database.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'widgets/begin_and_end_time.dart';
import 'widgets/lessons_details.dart';

class SecondLessonScreenViewBody extends StatefulWidget {
  const SecondLessonScreenViewBody({super.key, required this.user});
  final User? user;

  @override
  State<SecondLessonScreenViewBody> createState() => _SecondLessonScreenViewBodyState();
}

class _SecondLessonScreenViewBodyState extends State<SecondLessonScreenViewBody> {
  final fireStore = FirebaseFirestore.instance;

  // final CollectionReference _teachersRef =
  // FirebaseFirestore.instance.collection('chapters');
  // final CollectionReference _subscriptionsRef =
  // FirebaseFirestore.instance.collection('subscriptions');
  //
  // List<Map<String, dynamic>> _teachersList = [];
  // final User? currentUser = FirebaseAuth.instance.currentUser;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchTeachers();
  // }
  //
  // // Fetch teachers from Firestore
  // void _fetchTeachers() async {
  //   _teachersRef.get().then((QuerySnapshot snapshot) {
  //     List<Map<String, dynamic>> loadedTeachers = [];
  //     snapshot.docs.forEach((doc) {
  //       loadedTeachers.add({
  //         'id': doc.id,
  //         'name': doc['name'],
  //         'subject': doc['subject'],
  //       });
  //     });
  //
  //     setState(() {
  //       _teachersList = loadedTeachers;
  //     });
  //   });
  // }
  //
  // // Subscribe to a teacher and save in Firestore
  // void _subscribeToTeacher(String teacherId) async {
  //   if (currentUser != null) {
  //     _subscriptionsRef
  //         .doc(currentUser!.uid)
  //         .collection('user_subscriptions')
  //         .doc(teacherId)
  //         .set({
  //       'subscribed': true,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     }).then((_) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Subscribed successfully!')),
  //       );
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please log in to subscribe')),
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              // StreamBuilder<QuerySnapshot>(
              //     stream: fireStore.collection('teacher').doc(),
              //     builder: builder),
              Text(
                '4 حصص',
                style: FontAsset.font20WeightSemiBold,
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemExtent: ScreenSize.height(context) * 0.6,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: LessonsDetails(),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
