import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:sigmaty/Sigmaty/presentation/pages/teacher/notifications_partition/notifications_partition_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/teacher/packages/packages_view.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/teacher/student_partition/student_partition_view.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/account/teacher_account_view_body.dart';

import '../../../../constants/assets_data.dart';
import '../../../../constants/colors_asset.dart';

class MainTeacherViewBody extends StatefulWidget {
  const MainTeacherViewBody({super.key});

  @override
  State<MainTeacherViewBody> createState() => _MainTeacherViewBodyState();
}

class _MainTeacherViewBodyState extends State<MainTeacherViewBody> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const PackagesView(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              AssetsData.home,
              color: ColorsAsset.mainColor,
            ),
            inactiveIcon: SvgPicture.asset(
              AssetsData.home,
              color: ColorsAsset.hintColor,
            ),
            activeColorSecondary: ColorsAsset.mainColor,
            title: "الرئيسية",
          ),
        ),
        PersistentTabConfig(
          screen: const StudentPartitionView(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              AssetsData.studentIcon,
              color: ColorsAsset.mainColor,
            ),
            inactiveIcon: SvgPicture.asset(
              AssetsData.studentIcon,
              color: ColorsAsset.hintColor,
            ),
            title: "الطلاب",
          ),
        ),
        PersistentTabConfig(
          screen: const NotificationsPartitionView(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              AssetsData.notifications,
              color: ColorsAsset.mainColor,
            ),
            inactiveIcon: SvgPicture.asset(
              AssetsData.notifications,
              color: ColorsAsset.hintColor,
            ),
            title: "الاشعارات",
          ),
        ),
        PersistentTabConfig(
          screen: const TeacherAccountViewBody(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              AssetsData.profile,
              color: ColorsAsset.mainColor,
            ),
            inactiveIcon: SvgPicture.asset(
              AssetsData.profile,
              color: ColorsAsset.hintColor,
            ),
            title: "الملف الشخصي",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarHeight: 56,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}

// List<Widget> _buildScreens() {
//   return [
//     PackagesView(),
//     StudentPartitionView(),
//     NotificationsPartitionView(),
//     TeacherAccountViewBody()
//   ];
// }
//
// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         AssetsData.home,
//       ),
//       contentPadding: 4,
//       inactiveIcon: SvgPicture.asset(
//         AssetsData.home,
//       ),
//       title: 'الرئيسية',
//       textStyle: TextStyle(fontSize: 10),
//       activeColorPrimary: ColorsAsset.mainColor,
//       inactiveColorPrimary: ColorsAsset.mainColor,
//     ),
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         AssetsData.studentIcon,
//       ),
//       inactiveIcon: SvgPicture.asset(
//         AssetsData.studentIcon,
//       ),
//       title: 'الطلاب',
//       textStyle: TextStyle(fontSize: 10),
//       activeColorPrimary: ColorsAsset.mainColor,
//       inactiveColorPrimary: ColorsAsset.mainColor,
//     ),
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         AssetsData.notifications,
//       ),
//       inactiveIcon: SvgPicture.asset(
//         AssetsData.notifications,
//       ),
//       title: 'الاشعارات',
//       textStyle: TextStyle(fontSize: 10),
//       activeColorPrimary: ColorsAsset.mainColor,
//       inactiveColorPrimary: ColorsAsset.mainColor,
//     ),
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         AssetsData.profile,
//       ),
//       inactiveIcon: SvgPicture.asset(
//         AssetsData.profile,
//       ),
//       title: 'الملف الشخصي',
//       textStyle: TextStyle(fontSize: 10),
//       activeColorPrimary: ColorsAsset.mainColor,
//       inactiveColorPrimary: ColorsAsset.mainColor,
//     ),
//   ];
// }
//
// @override
// Widget build(BuildContext context) {
//   return PersistentTabView(
//     context,
//     screens: _buildScreens(),
//     items: _navBarsItems(),
//     controller: controller,
//     confineInSafeArea: true,
//     backgroundColor: Colors.white,
//     handleAndroidBackButtonPress: true,
//     resizeToAvoidBottomInset: true,
//     stateManagement: true,
//     hideNavigationBarWhenKeyboardShows: true,
//     decoration: NavBarDecoration(
//       borderRadius: BorderRadius.circular(0),
//       colorBehindNavBar: Colors.white,
//     ),
//     popAllScreensOnTapOfSelectedTab: true,
//     popActionScreens: PopActionScreensType.all,
//     itemAnimationProperties: const ItemAnimationProperties(
//       duration: Duration(milliseconds: 200),
//       curve: Curves.ease,
//     ),
//     screenTransitionAnimation: const ScreenTransitionAnimation(
//       animateTabTransition: true,
//       curve: Curves.ease,
//       duration: Duration(milliseconds: 200),
//     ),
//     navBarStyle: NavBarStyle.style6,
//     navBarHeight: 56,
//   );
// }

// int _selectedIndex = 0;
//
// List _pages = [
//   PackagesView(),
//   StudentPartitionView(),
//   NotificationsPartitionView(),
//   TeacherAccountViewBody()
// ];
//
// void _onItemTapped(int index) {
//   setState(() {
//     _selectedIndex = index;
//   });
// }
//
//
// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//       child: Scaffold(
//     body: Center(
//       child: _pages.elementAt(_selectedIndex),
//     ),
//     bottomNavigationBar: BottomNavigationBar(
//       items: [
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.home,
//               color: ColorsAsset.hintColor,
//             ),
//             activeIcon: SvgPicture.asset(AssetsData.home,
//                 color: ColorsAsset.mainColor),
//             label: 'الرئيسية'),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.studentIcon,
//               color: ColorsAsset.hintColor,
//             ),
//             activeIcon: SvgPicture.asset(AssetsData.studentIcon,
//                 color: ColorsAsset.mainColor),
//             label: 'الطلاب'),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.notifications,
//               color: ColorsAsset.hintColor,
//             ),
//             activeIcon: SvgPicture.asset(AssetsData.notifications,
//                 color: ColorsAsset.mainColor),
//             label: 'الاشعارات'),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.profile,
//               color: ColorsAsset.hintColor,
//             ),
//             activeIcon: SvgPicture.asset(AssetsData.profile,
//                 color: ColorsAsset.mainColor),
//             label: 'الملف الشخصي'),
//       ],
//       iconSize: 24,
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.white,
//       elevation: 20,
//       selectedItemColor: ColorsAsset.mainColor,
//       unselectedItemColor: ColorsAsset.hintColor,
//     ),
//   ));
// }
