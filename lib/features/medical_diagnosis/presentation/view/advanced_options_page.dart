import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdvancedOptionsPage extends StatelessWidget {
  AdvancedOptionsPage({super.key, required this.test});
  static String id = 'AdvancedOptionsPage';
  bool test;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 686,
        width: 400,
        decoration: const BoxDecoration(
          color: Color(0xffFAFAFA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Color(0xff292D32),
                      size: 24,
                    ),
                  ),
                  const DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: kRoboto,
                          color: kBlackColor,
                          fontWeight: FontWeight.w500),
                      child: Text('Advanced Options')),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Advanced options like',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: kRoboto,
                  color: kBlackColor,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: 327.w,
                height: 155.h,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color(0xff0A0A0A).withOpacity(.12)),
                ),
                child: BulletList(
                  test
                      ? [
                          'Know which doctor to go to',
                          'Read you result with speech',
                          'Compare between your medical test results  '
                        ]
                      : [
                          'Know which doctor to go to',
                          'Read you result with speech',
                        ],
                ),
              ),
            ),
            SizedBox(
              height: 250.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                  text: 'Purchase for 99.9 EGP',
                  size: 16.sp,
                  width: 327.w,
                  height: 43.h,
                  color: kPrimaryColor,
                  borderRadius: 16,
                  textColor: kWhiteColor,
                  borderColor: kPrimaryColor),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> strings;

  const BulletList(this.strings, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map(
          (str) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\u2022',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff979797),
                    fontSize: 16,
                    height: 1.55,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      str,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0xff979797),
                        height: 1.55,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
