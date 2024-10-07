import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/colors_asset.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/parents/account/parent_account_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/parents/lessons/parent_second_lesson_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/parents/parents_home/parents_home_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/student/home_teacher/home/student_home_view.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/parents/account/parents_account_view_body.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/parents/lessons/parent_second_lesson_screen_view_body.dart';

class ParentMainTeacherViewBody extends StatefulWidget {
  const ParentMainTeacherViewBody({super.key});

  @override
  State<ParentMainTeacherViewBody> createState() =>
      _ParentMainTeacherViewBodyState();
}

class _ParentMainTeacherViewBodyState extends State<ParentMainTeacherViewBody> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  List _pages = [
    ParentsHomeView(),
    ParentSecondLessonView(),
    ParentAccountView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedIconTheme:
            IconThemeData(color: ColorsAsset.mainColor, size: 40),
        selectedItemColor: ColorsAsset.mainColor,
        selectedLabelStyle: FontAsset.font12WeightMedium.copyWith(
            color: ColorsAsset.mainColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        unselectedIconTheme: IconThemeData(
          color: ColorsAsset.hintColor,
        ),
        unselectedItemColor: ColorsAsset.hintColor,
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
              label: 'الرئيسية'),

          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsData.notifications,
                height: ScreenSize.height(context) * 0.03,
                width: ScreenSize.width(context) * 0.03,
                color: _selectedIndex == 1
                    ? ColorsAsset.mainColor
                    : ColorsAsset.hintColor,
              ),
              label: 'الاشعارات'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsData.profile,
                height: ScreenSize.height(context) * 0.03,
                width: ScreenSize.width(context) * 0.03,
                color: _selectedIndex == 2
                    ? ColorsAsset.mainColor
                    : ColorsAsset.hintColor,
              ),
              label: 'الملف الشخصي'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    ));
  }
}
