import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/pages/login/login_view.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/customizations/feature_user_custom/feature_user_custom.dart';

class FeaturesUsersViewBody extends StatelessWidget {
  const FeaturesUsersViewBody(
      {super.key,
      required this.student,
      required this.teacher,
      required this.parents,
      required this.visitor});
  final String student;
  final String teacher;
  final String parents;
  final String visitor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: ScreenSize.height(context),
        width: ScreenSize.width(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsData.backgroundFeatures),
                fit: BoxFit.fill)),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FeatureUserCustom(
                      featureImage: AssetsData.student,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView(
                                      userType: student,
                                    )));
                      },
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    FeatureUserCustom(
                      featureImage: AssetsData.teacher,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView(
                                      userType: teacher,
                                    )));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FeatureUserCustom(
                      featureImage: AssetsData.parents,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView(
                                      userType: parents,
                                    )));
                      },
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    FeatureUserCustom(
                      featureImage: AssetsData.visitor,
                      onTap: () {
                        context.pushReplacement('/MainStudentScreen');
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
    ));
  }
}
