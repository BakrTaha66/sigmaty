import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/teacher/notifications_partition/widgets/build_notification_teacher_container.dart';
 import '../../../../constants/font_asset.dart';

class NotificationsPartitionViewBody extends StatelessWidget {
  const NotificationsPartitionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text("الاشعارات", style: FontAsset.font20WeightSemiBold),
                  SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context,index){
                        return BuildNotificationTeacherContainer.buildNotificationContainer(context);
                      })

                ],
              ),
            ),
          ),
        ));
  }

}

