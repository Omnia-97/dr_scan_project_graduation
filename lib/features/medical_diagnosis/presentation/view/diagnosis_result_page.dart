import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/advanced_options_page.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class DiagnosisResultPage extends StatelessWidget {
  const DiagnosisResultPage({
    Key? key,
    required this.resultModel,
  }) : super(key: key);
  static String id = 'DiagnosisResultPage';

  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(90.w, 90.h),
        child: SafeArea(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36),
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
                    'Diagnosis ${resultModel.id}',
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
      body: Stack(
        children: [
          // Image.asset('assets/images/Union.png'),
          ListView(
            children: [
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
                    border: Border.all(
                        color: const Color(0xff0A0A0A).withOpacity(.12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, top: 20.h, right: 20.w, bottom: 20.h),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: resultModel.diagnosis.length,
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemBuilder: (context, index) {
                          final String confidence = resultModel
                              .diagnosis[index].confidence
                              .toStringAsFixed(2);
                          return Text(
                            '${resultModel.diagnosis[index].prediction} $confidence%',
                            style: TextStyle(
                                height: 1.5.h,
                                fontSize: 17.sp,
                                color: const Color(0xff979797),
                                fontFamily: kRoboto,
                                fontWeight: FontWeight.w500),
                          );
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  resultModel.date,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: kRoboto,
                    color: const Color(0xff808080),
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
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
                                test: false,
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
          )
        ],
      ),
    );
  }
}
