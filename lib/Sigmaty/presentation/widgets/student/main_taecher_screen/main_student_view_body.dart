import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/history/second_lesson_screen_view/second_lesson_screen_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/student/account/account_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/student/home_teacher/home/student_home_view.dart';

import '../../../pages/notfications/notfication_view.dart';

class MainStudentViewBody extends StatefulWidget {
  const MainStudentViewBody({super.key, required this.user});
  final User? user;

  @override
  State<MainStudentViewBody> createState() => _MainStudentViewBodyState();
}

class _MainStudentViewBodyState extends State<MainStudentViewBody> {

  int _selectedIndex = 0;

  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      StudentHomeView(user: widget.user),
      SecondLessonScreenView(user: widget.user),
      NotificationView(),
      AccountView()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsData.home,
              height: ScreenSize.height(context) * 0.03,
              width: ScreenSize.width(context) * 0.03,
              color: _selectedIndex == 0
              ? ColorsAsset.mainColor
              : ColorsAsset.hintColor,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsData.lessons,
              height: ScreenSize.height(context) * 0.03,
              width: ScreenSize.width(context) * 0.03,
              color: _selectedIndex == 1
              ? ColorsAsset.mainColor
              : ColorsAsset.hintColor,
            ),
            label: 'الحصص',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsData.notifications,
              height: ScreenSize.height(context) * 0.03,
              width: ScreenSize.width(context) * 0.03,
              color: _selectedIndex == 2
              ? ColorsAsset.mainColor
              : ColorsAsset.hintColor,
            ),
            label: 'الاشعارات',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsData.profile,
              height: ScreenSize.height(context) * 0.03,
              width: ScreenSize.width(context) * 0.03,
              color: _selectedIndex == 3
              ? ColorsAsset.mainColor
              : ColorsAsset.hintColor,
            ),
            label: 'الملف الشخصي',
          ),
        ],
        iconSize: 24,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 20,
        selectedItemColor: ColorsAsset.mainColor,
        unselectedItemColor: ColorsAsset.hintColor,
      ),

    );
  }
}

