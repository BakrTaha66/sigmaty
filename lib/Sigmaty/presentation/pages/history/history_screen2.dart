import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:sigmaty/Sigmaty/constants/screen_size.dart';

class HistoryScreen2 extends StatefulWidget {
  const HistoryScreen2({super.key});

  @override
  State<HistoryScreen2> createState() => _HistoryScreen2State();
}

class _HistoryScreen2State extends State<HistoryScreen2> {
  bool isMenuVisible = false; // للتحكم في إظهار أو إخفاء القائمة
  bool isquestionVisible = false; // للتحكم في إظهار أو إخفاء القائمة
  bool isFirstButtonVisible = true; // التحكم في عرض الزر الأول أو الثاني
  bool isSecondButtonVisible = true; // التحكم في عرض الزر الأول أو الثاني
  bool isThirdButtonVisible = true;
  bool isFourthButtonVisible = true;
  bool isFifthButtonVisible = true;
  bool isSixthButtonVisible = true;
  bool isSeventhButtonVisible = true;
  bool isEighthButtonVisible = true;
  String? selectedOption;
  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: 
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios))
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 30.0, bottom: 50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "final revisions - session 1: rafsyuggs ",
                style: FontAsset.font16WeightSemiBold,
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.03,
              ),
              Image.asset("assets/images/Rectangle 6.png"),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // محاذاة العناصر إلى البداية
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // محاذاة العمود مع الصورة في الوسط
                  children: [
                    const CircleAvatar(
                      // radius: 50, // حجم الدائرة (يمكنك تعديله)
                      backgroundImage: AssetImage(
                          'assets/images/Rectangle 7.png'), // استخدم AssetImage
                    ),
                    SizedBox(
                      width: ScreenSize.width(context) * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الاستاذ : محمد سعد",
                          style: FontAsset.font16WeightSemiBold,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0),
                          child: Text(
                            "فيزياء",
                            style: FontAsset.font16WeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width -
                      60, // Adjust width to match text width
                  color: Colors.grey,
                  height: 0.6, // Line thickness
                ),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isMenuVisible =
                        !isMenuVisible; // تغيير حالة القائمة (إظهار/إخفاء)
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // محاذاة العناصر إلى البداية
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // محاذاة العمود مع الصورة في الوسط
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.video_library_outlined),
                              Text(
                                "فيديوهات",
                                style: FontAsset.font16WeightSemiBold,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "4",
                              style: FontAsset.font16WeightSemiBold,
                            ),
                          ),
                        ],
                      ),
                      // هنا يتم إدراج عنصر الـ Visibility
                      Visibility(
                        visible: isMenuVisible, // تظهر القائمة إذا كانت true
                        child: Column(
                          children: <Widget>[
                            isFirstButtonVisible
                                ? ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[200],
                                        padding: const EdgeInsets.only(
                                            right: 120.0, left: 120.0)),
                                    icon: const Icon(
                                      Icons.video_collection_outlined,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isFirstButtonVisible =
                                            false; // التبديل إلى الزر الثاني
                                      });
                                    },
                                    label: const Text(
                                      'فيديو 1',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.only(
                                          right: 120.0, left: 120.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isFirstButtonVisible =
                                            true; // التبديل إلى الزر الأول
                                      });
                                    },
                                    child: const Text(' تمت المشاهدة',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                            isSecondButtonVisible
                                ? ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[200],
                                        padding: const EdgeInsets.only(
                                            right: 120.0, left: 120.0)),
                                    icon: const Icon(
                                      Icons.video_collection_outlined,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isSecondButtonVisible =
                                            false; // التبديل إلى الزر الثاني
                                      });
                                    },
                                    label: const Text(
                                      'فيديو 2',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.only(
                                          right: 120.0, left: 120.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isSecondButtonVisible =
                                            true; // التبديل إلى الزر الأول
                                      });
                                    },
                                    child: const Text(' تمت المشاهدة',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                            isThirdButtonVisible
                                ? ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[200],
                                        padding: const EdgeInsets.only(
                                            right: 120.0, left: 120.0)),
                                    icon: const Icon(
                                      Icons.video_collection_outlined,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isThirdButtonVisible =
                                            false; // التبديل إلى الزر الثاني
                                      });
                                    },
                                    label: const Text(
                                      'فيديو 3',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.only(
                                          right: 120.0, left: 120.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isThirdButtonVisible =
                                            true; // التبديل إلى الزر الأول
                                      });
                                    },
                                    child: const Text(' تمت المشاهدة',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                            isFourthButtonVisible
                                ? ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[200],
                                        padding: const EdgeInsets.only(
                                            right: 120.0, left: 120.0)),
                                    icon: const Icon(
                                      Icons.video_collection_outlined,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isFourthButtonVisible =
                                            false; // التبديل إلى الزر الثاني
                                      });
                                    },
                                    label: const Text(
                                      'فيديو 4',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.only(
                                          right: 120.0, left: 120.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isFourthButtonVisible =
                                            true; // التبديل إلى الزر الأول
                                      });
                                    },
                                    child: const Text(' تمت المشاهدة',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width -
                      60, // Adjust width to match text width
                  color: Colors.grey,
                  height: 0.6, // Line thickness
                ),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isquestionVisible =
                            !isquestionVisible; // تغيير حالة القائمة (إظهار/إخفاء)
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // محاذاة العناصر إلى البداية
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // محاذاة العمود مع الصورة في الوسط
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.menu),
                              Text(
                                "الاسئلة",
                                style: FontAsset.font16WeightSemiBold,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "4",
                              style: FontAsset.font16WeightSemiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // القائمة تظهر تحت InkWell
                  Visibility(
                    visible: isquestionVisible, // تظهر القائمة إذا كانت true
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Column(
                        children: <Widget>[
                          isFifthButtonVisible
                              ? ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isFifthButtonVisible =
                                          false; // التبديل إلى الزر الثاني
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Container(
                                            width: ScreenSize.width(context) *
                                                1.5, // عرض الـ dialog
                                            height: ScreenSize.height(context) *
                                                0.8, // ارتفاع الـ dialog
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'السؤال 1',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),
                                                const Text(
                                                  ' تعريف الجاذبية ؟',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),

                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 1',
                                                  groupValue: selectedOption,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption = value;
                                                    });
                                                  },
                                                ),
                                                // Radio Button 2
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption1,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption1 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption2,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption2 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blue),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // إغلاق الـ dialog
                                                  },
                                                  child: const Text(
                                                    'تأكيد الاجابة',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: const Text(
                                    'السؤال 1',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isFifthButtonVisible =
                                          true; // التبديل إلى الزر الأول
                                    });
                                  },
                                  child: const Text(' تمت الاجابة',
                                      style: TextStyle(color: Colors.white)),
                                ),
                          isSixthButtonVisible
                              ? ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isSixthButtonVisible =
                                          false; // التبديل إلى الزر الأول
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Container(
                                            width: ScreenSize.width(context) *
                                                1.5, // عرض الـ dialog
                                            height: ScreenSize.height(context) *
                                                0.8, // ارتفاع الـ dialog
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'السؤال 1',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),
                                                const Text(
                                                  ' تعريف الجاذبية ؟',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),

                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 1',
                                                  groupValue: selectedOption,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption = value;
                                                    });
                                                  },
                                                ),
                                                // Radio Button 2
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption1,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption1 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption2,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption2 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blue),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // إغلاق الـ dialog
                                                  },
                                                  child: const Text(
                                                    'تأكيد الاجابة',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: const Text(
                                    'السؤال 2',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isSixthButtonVisible =
                                          true; // التبديل إلى الزر الأول
                                    });
                                  },
                                  child: const Text(' تمت الاجابة',
                                      style: TextStyle(color: Colors.white)),
                                ),
                          isSeventhButtonVisible
                              ? ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isSeventhButtonVisible =
                                          false; // التبديل إلى الزر الأول
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Container(
                                            width: ScreenSize.width(context) *
                                                1.5, // عرض الـ dialog
                                            height: ScreenSize.height(context) *
                                                0.8, // ارتفاع الـ dialog
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'السؤال 1',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),
                                                const Text(
                                                  ' تعريف الجاذبية ؟',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),

                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 1',
                                                  groupValue: selectedOption,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption = value;
                                                    });
                                                  },
                                                ),
                                                // Radio Button 2
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption1,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption1 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption2,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption2 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blue),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // إغلاق الـ dialog
                                                  },
                                                  child: const Text(
                                                    'تأكيد الاجابة',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: const Text(
                                    'السؤال 3',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isSeventhButtonVisible =
                                          true; // التبديل إلى الزر الأول
                                    });
                                  },
                                  child: const Text(' تمت الاجابة',
                                      style: TextStyle(color: Colors.white)),
                                ),
                          isEighthButtonVisible
                              ? ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isEighthButtonVisible =
                                          false; // التبديل إلى الزر الأول
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Container(
                                            width: ScreenSize.width(context) *
                                                1.5, // عرض الـ dialog
                                            height: ScreenSize.height(context) *
                                                0.8, // ارتفاع الـ dialog
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'السؤال 1',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),
                                                const Text(
                                                  ' تعريف الجاذبية ؟',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 20),

                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 1',
                                                  groupValue: selectedOption,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption = value;
                                                    });
                                                  },
                                                ),
                                                // Radio Button 2
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption1,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption1 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption2,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption2 = value;
                                                    });
                                                  },
                                                ),
                                                RadioListTile<String>(
                                                  activeColor: Colors.blue,
                                                  title: const Text(
                                                    'هي ظاهرة طبيعية يتم بواسطتها تحريك وانجذاب كل الأشياء من الكتلة',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: 'Option 2',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blue),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // إغلاق الـ dialog
                                                  },
                                                  child: const Text(
                                                    'تأكيد الاجابة',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: const Text(
                                    'السؤال 4',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.only(
                                        right: 120.0, left: 120.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isEighthButtonVisible =
                                          true; // التبديل إلى الزر الأول
                                    });
                                  },
                                  child: const Text(' تمت الاجابة',
                                      style: TextStyle(color: Colors.white)),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.85, // Adjust width to match text width
                  height: 1.0, // Line thickness
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.history_rounded),
                    Text(
                      "صلاحية المشاهدة : 7 ايام",
                      style: FontAsset.font16WeightMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenSize.height(context) * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تنتهي",
                            style: FontAsset.font16WeightMedium,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "6/30/2024",
                                style: FontAsset.font16WeightMedium,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              const Icon(Icons.calendar_month_outlined)
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "9:00 مساء",
                                style: FontAsset.font16WeightMedium,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              const Icon(Icons.access_time_rounded)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width:
                              0.6, // Line thickness (width of the vertical line)
                          height: MediaQuery.of(context).size.height *
                              0.21, // Adjust height as needed
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تبدأ",
                            style: FontAsset.font16WeightMedium,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "6/30/2024",
                                style: FontAsset.font16WeightMedium,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              const Icon(Icons.calendar_month_outlined)
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "9:00 مساء",
                                style: FontAsset.font16WeightMedium,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              const Icon(Icons.access_time_rounded)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
 