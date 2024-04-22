import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/advanced_options_page.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';


class TestResultPage extends StatelessWidget {
  const TestResultPage({Key? key}) : super(key: key);
  static String id = 'TestResultPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(90.w, 90.h),
        child: SafeArea(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 36,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Container(
                height: 120,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 48.h),
                  child: Text(
                    'Test 1',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontFamily: kRoboto,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: kWhiteColor,
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Image.asset(
              'assets/images/photo_2023-04-19_21-12-06.jpg',
              height: 250.h,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              '3/10/2023',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: kRoboto,
                color: const Color(0xff808080),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 27.h, left: 20.w),
            child: Text(
              'Your Result is ',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: kRoboto,
                  color: kBlackColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: const Color(0xff0A0A0A).withOpacity(.12)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.w, top: 20.h, right: 20.w, bottom: 20.h),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor sit amet',
                  style: TextStyle(
                      height: 1.5.h,
                      fontSize: 17.sp,
                      color: const Color(0xff979797),
                      fontFamily: kRoboto,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
                onTap: () {
                  showSlidingBottomSheet(context, builder: (context) {
                    return SlidingSheetDialog(
                        elevation: 8,
                        cornerRadius: 32,
                        minHeight: 686,
                        builder: (context, state) {
                          return AdvancedOptionsPage(
                            test: true,
                          );
                        });
                  });
                },
                text: 'Advanced options',
                size: 16.sp,
                width: 330.w,
                height: 42.h,
                color: kPrimaryColor,
                borderRadius: 16,
                textColor: kWhiteColor,
                borderColor: kPrimaryColor),
          ),
          SizedBox(
            height: 22.h,
          ),
        ],
      ),
    );
  }
}
