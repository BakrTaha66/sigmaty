import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

import '../../payment_screen/payment_screen1.dart';

class SessionsScreenBody extends StatefulWidget {
  const SessionsScreenBody({
    super.key,
    required this.teacherName,
    required this.sessionItem,
  });

  final String teacherName;
  final List<dynamic> sessionItem;

  @override
  State<SessionsScreenBody> createState() => _SessionsScreenBodyState();
}

class _SessionsScreenBodyState extends State<SessionsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'الاستاذ: ${widget.teacherName}',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الحصص",
                  style: FontAsset.font16WeightSemiBold,
                ),
                Text(
                  '(${widget.sessionItem.length}) حصص',
                  style: FontAsset.font16WeightSemiBold,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: MediaQuery.of(context).size.width > 600
                    ? 0.5 / 0.18 // Landscape
                    : 0.5 / 0.4, // Portrait
              ),
              itemCount: widget.sessionItem.length,
              itemBuilder: (context, index) {
                // Map session = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen1(sessionItem: widget.sessionItem, teacherName: widget.teacherName, index: index,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(widget.sessionItem[index]['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff249EF1),
                              Colors.black.withOpacity(0.25),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/Rectangle 7.png'),
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        'الاستاذ: ${widget.teacherName}',
                                        style: FontAsset.font16WeightSemiBold
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${widget.sessionItem[index]['sessionName']}',
                                    style: FontAsset.font16WeightSemiBold
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: ScreenSize.width(context),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.history_rounded),
                                        const SizedBox(width: 8),
                                        Text(
                                          "صلاحية المشاهدة : 7 ايام",
                                          style: FontAsset.font16WeightMedium,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "120 ج.م",
                                      style: FontAsset.font20WeightSemiBold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


