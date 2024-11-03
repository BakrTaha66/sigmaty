import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';
import 'package:sigmaty/Sigmaty/presentation/payment_screen/payment_screen2.dart';

class PaymentScreen1 extends StatefulWidget {
  const PaymentScreen1({
    super.key,
    required this.teacherName,
    required this.sessionItem,
    required this.index,
  });
  final String teacherName;
  final List<dynamic> sessionItem;
  final int index;

  @override
  State<PaymentScreen1> createState() => _PaymentScreen1State();
}

class _PaymentScreen1State extends State<PaymentScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${widget.sessionItem[widget.index]['sessionName']}',
                style: FontAsset.font16WeightSemiBold,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 340,
                width: ScreenSize.width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${widget.sessionItem[widget.index]['image']}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Rectangle 7.png'),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الاستاذ: ${widget.teacherName}',
                          style: FontAsset.font16WeightSemiBold,
                        ),
                        Text(
                          "فيزياء",
                          style: FontAsset.font16WeightSemiBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                color: Colors.grey,
                height: 0.6, // Line thickness
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         const Icon(Icons.video_library_outlined),
                  //         SizedBox(
                  //           width: 8,
                  //         ),
                  //         Text(
                  //           "فيديوهات",
                  //           style: FontAsset.font16WeightSemiBold,
                  //         ),
                  //       ],
                  //     ),
                  //     Text(
                  //       "4",
                  //       style: FontAsset.font16WeightSemiBold,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   color: Colors.grey,
                  //   height: 0.6, // Line thickness
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.menu),
                          SizedBox(width: 8),
                          Text(
                            "الاسئلة",
                            style: FontAsset.font16WeightSemiBold,
                          ),
                        ],
                      ),
                      Text(
                        "4",
                        style: FontAsset.font16WeightSemiBold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey,
                    height: 0.6, // Line thickness
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.history_rounded),
                      SizedBox(width: 8),
                      Text(
                        "صلاحية المشاهدة : 7 ايام",
                        style: FontAsset.font16WeightMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "120 ج.م",
                    style: FontAsset.font20WeightSemiBold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 40),
                    ),
                    onPressed: () {},
                    label: const Text(
                      "اشتري الان",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 40),
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen2(
                                    sessionItem: widget.sessionItem,
                                    teacherName: widget.teacherName,
                                    index: widget.index,
                                  )));
                    },
                    label: const Text(
                      "ادخل الكود",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
