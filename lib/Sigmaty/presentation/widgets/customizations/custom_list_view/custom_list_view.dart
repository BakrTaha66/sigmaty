import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body:  Container(
                    height: ScreenSize.height(context)*0.15,
                    width: ScreenSize.width(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image:const DecorationImage(image: AssetImage("assets/images/Rectangle 6.png"),fit: BoxFit.fill),
                     
                    ),
                    child: Container(
                        height: ScreenSize.height(context)*0.15,
                        width: ScreenSize.width(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              const Color(0xff249EF1),
                              Colors.black.withOpacity(0.25),

                            ],
                                begin: Alignment.bottomCenter,end: Alignment.topCenter)
                        ),
                  ),
                    ),
    );
  }
}