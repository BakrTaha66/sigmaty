// import 'package:flutter/material.dart';
// import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
// import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

// class SessionsScreenBody extends StatefulWidget {
//   const SessionsScreenBody({super.key});

//   @override
//   State<SessionsScreenBody> createState() => _SessionsScreenBodyState();
// }

// class _SessionsScreenBodyState extends State<SessionsScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.5,
//         title: Center(
//           child: Text(
//             "الاستاذ : محمد سعد",
//             style: FontAsset.font16WeightSemiBold,
//           ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: const Icon(Icons.arrow_forward_ios))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "حصص (8)",
//                   style: FontAsset.font16WeightSemiBold,
//                 ),
//                 Text(
//                   "الحصة",
//                   style: FontAsset.font16WeightSemiBold,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: InkWell(
//                 onTap: () {},
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     crossAxisSpacing: 16.0,
//                     mainAxisSpacing: 16.0,
//                     childAspectRatio: 0.5 / 0.33,
//                   ),
//                   itemCount: 13,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(),
//                           borderRadius: BorderRadius.circular(20.0)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Stack(
//                             children: [
//                               Container(
//                                 height: ScreenSize.height(context) * 0.15,
//                                 width: ScreenSize.width(context),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   image: const DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/Rectangle 6.png"),
//                                       fit: BoxFit.fill),
//                                 ),
//                                 child: Container(
//                                   height: ScreenSize.height(context) * 0.15,
//                                   width: ScreenSize.width(context),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       gradient: LinearGradient(
//                                           colors: [
//                                             const Color(0xff249EF1),
//                                             Colors.black.withOpacity(0.25),
//                                           ],
//                                           begin: Alignment.bottomCenter,
//                                           end: Alignment.topCenter)),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 40,
//                                 left: 40,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 0.0),
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 100.0),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           // children: [
//                                           //   Column(
//                                               children: [
//                                                 const CircleAvatar(
//                                                   // radius: 50, // حجم الدائرة (يمكنك تعديله)
//                                                   backgroundImage: AssetImage(
//                                                       'assets/images/Rectangle 7.png'), // استخدم AssetImage
//                                                 ),
//                                                 // Text(
//                                                 //   "الاستاذ : محمد سعد",
//                                                 //   style: FontAsset
//                                                 //       .font16WeightSemiBold
//                                                 //       .copyWith(
//                                                 //           color: Colors.white),
//                                                 // ),
//                                                 // SizedBox(
//                                                 //   height: ScreenSize.height(
//                                                 //           context) *
//                                                 //       0.002,
//                                                 // ),
//                                             //   ],
//                                             // ),
//                                             SizedBox(
//                                               width: ScreenSize.width(context) *
//                                                   0.02,
//                                             ),
//                                             Text(
//                                               "الاستاذ : محمد سعد",
//                                               style: FontAsset
//                                                   .font16WeightSemiBold
//                                                   .copyWith(
//                                                       color: Colors.white),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height:
//                                             ScreenSize.height(context) * 0.008,
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(right: 20.0),
//                                         child: Center(
//                                           child: Text(
//                                             "final revisions - session 1: rafsyuggs",
//                                             style: FontAsset
//                                                 .font16WeightSemiBold
//                                                 .copyWith(color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),

//                               // إضافة النص فوق الصورة
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenSize.height(context) * 0.02,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 90.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "صلاحية المشاهدة : 7 ايام",
//                                   style: FontAsset.font16WeightMedium,
//                                 ),
//                                 SizedBox(
//                                   width: ScreenSize.width(context) * 0.02,
//                                 ),
//                                 const Icon(Icons.history_rounded),
//                                 SizedBox(
//                                   width: ScreenSize.width(context) * 0.02,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: ScreenSize.height(context) * 0.01,
//                           ),
//                           Center(
//                             child: Text(
//                               "120 ج.م",
//                               style: FontAsset.font20WeightSemiBold,
//                             ),
//                           ),
//                           SizedBox(
//                             height: ScreenSize.height(context) * 0.01,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }