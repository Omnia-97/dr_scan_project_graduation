import 'package:dr_scan_graduation_project/core/utils/binding.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/result_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/diagnosis_result_page.dart';
import 'package:dr_scan_graduation_project/features/medical_history/presentation/view_model/result_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_test_analysis/presentation/view/test_result_page.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);
  static String id = 'SavedPage';

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  bool diagnosis = true;
  bool tests = false;
  String label = "Some Label";
  List dummyList = ['Test 1', 'Test 2', 'Test 3', 'Item 4', 'Item 5'];
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          SizedBox(
            height: 78.h,
          ),
          Text(
            'Saved',
            style: TextStyle(
                fontSize: 22.sp,
                fontFamily: kRoboto,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 340.w,
              height: 55.h,
              decoration: BoxDecoration(
                  color: const Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  diagnosis
                      ? CustomButton(
                          text: 'Diagnosis ',
                          size: 15.sp,
                          width: 165.w,
                          height: 40.h,
                          color: kPrimaryColor,
                          borderRadius: 15,
                          textColor: kWhiteColor,
                          borderColor: kPrimaryColor,
                          fontweight: FontWeight.w600,
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              diagnosis = true;
                              tests = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 43.w),
                            child: Text(
                              'Diagnosis',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: kRoboto),
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 35.w,
                  ),
                  tests
                      ? Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: CustomButton(
                            text: 'Tests ',
                            size: 15.sp,
                            width: 165.w,
                            height: 40.h,
                            color: kPrimaryColor,
                            borderRadius: 15,
                            textColor: kWhiteColor,
                            borderColor: kPrimaryColor,
                            fontweight: FontWeight.w600,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              diagnosis = false;
                              tests = true;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 18.w),
                            child: Text(
                              'Tests',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: kRoboto),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          // diagnosis
          //     ? SizedBox(
          //         height: 10.h,
          //       )
          //     : SizedBox(
          //         height: 30.h,
          //       ),
          diagnosis
              ? GetX(
                  init: sl<ResultViewModel>(),
                  builder: (controller) {
                    return controller.isLoading
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 15.h),
                              itemCount: controller.diagnosisResults.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.h),
                              itemBuilder: (context, index) {
                                return ResultTitle(
                                  resultModel:
                                      controller.diagnosisResults[index],
                                );
                              },
                            ),
                          );
                  },
                )
              : Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 15),
                    //   child: TextFieldSearch(
                    //     initialList: dummyList,
                    //     label: label,
                    //     controller: myController,
                    //     decoration: InputDecoration(
                    //       hintText: 'Search',
                    //       hintStyle: TextStyle(
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.w500,
                    //         fontFamily: kRoboto,
                    //         color: Color(0xff979797),
                    //       ),
                    //       filled: true,
                    //       fillColor: Color(0xffF7F7F7),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(37),
                    //         borderSide: BorderSide(
                    //           color: Color(0xffC1C1C1).withOpacity(.28),
                    //         ),
                    //       ),
                    //       prefixIcon: Icon(Icons.search),
                    //       prefixIconColor: Color(0xff939393),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(37),
                    //         borderSide: BorderSide(
                    //           color: Color(0xffC1C1C1).withOpacity(.28),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 15.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const TestResultPage());
                      },
                      child: Container(
                        width: 335.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Image.asset('assets/images/saved.png'),
                            SizedBox(
                              width: 25.w,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                const Text(
                                  'Test 1',
                                  style: TextStyle(
                                      color: Color(0xff373737),
                                      fontFamily: kRoboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Text(
                                  '3/10/2023',
                                  style: TextStyle(
                                      color: Color(0xff808080),
                                      fontSize: 14,
                                      fontFamily: kRoboto),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 134.w,
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                size: 16, color: kBlackColor)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.to(() => const DiagnosisResultPage());
                      },
                      child: Container(
                        width: 335.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Image.asset('assets/images/saved.png'),
                            SizedBox(
                              width: 25.w,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                const Text(
                                  'Test 2',
                                  style: TextStyle(
                                      color: Color(0xff373737),
                                      fontFamily: kRoboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Text(
                                  '3/10/2023',
                                  style: TextStyle(
                                      color: Color(0xff808080),
                                      fontSize: 14,
                                      fontFamily: kRoboto),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 134.w,
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                size: 16, color: kBlackColor)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 335.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Image.asset('assets/images/saved.png'),
                            SizedBox(
                              width: 25.w,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                const Text(
                                  'Test 3',
                                  style: TextStyle(
                                      color: Color(0xff373737),
                                      fontFamily: kRoboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Text(
                                  '3/10/2023',
                                  style: TextStyle(
                                      color: Color(0xff808080),
                                      fontSize: 14,
                                      fontFamily: kRoboto),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 134.w,
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                size: 16, color: kBlackColor)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
      bottomNavigationBar: NavBar(
          istabbed: false, istabbed1: true, istabbed2: false, istabbed3: false),
    );
  }
}

class ResultTitle extends StatelessWidget {
  const ResultTitle({
    super.key,
    required this.resultModel,
  });
  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DiagnosisResultPage(resultModel: resultModel));
      },
      child: Container(
        width: 335.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Image.asset('assets/images/saved.png'),
            SizedBox(width: 25.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  'Diagnosis ${resultModel.id}',
                  style: const TextStyle(
                      color: Color(0xff373737),
                      fontFamily: kRoboto,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                SizedBox(height: 5.h),
                Text(
                  '${resultModel.date}  ${resultModel.time}',
                  style: const TextStyle(
                      color: Color(0xff808080),
                      fontSize: 14,
                      fontFamily: kRoboto),
                )
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: kBlackColor),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}


// Column(
//                   children: [
//                     Image.asset(
//                       'assets/images/empty.png',
//                       width: 140.w,
//                       height: 140.h,
//                     ),
//                     Text(
//                       'This folder is empty',
//                       style: TextStyle(
//                           color: const Color(0xff979797),
//                           fontFamily: kRoboto,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 17.sp),
//                     ),
//                   ],
//                 )