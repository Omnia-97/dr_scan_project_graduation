import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/bpdy_parts_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:dr_scan_graduation_project/core/presentation/view/home_page.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/progress_bar.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/advanced_options_page.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/diagnosis_view_model.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class ResultView extends GetWidget<DiagnosisViewModel> {
  static const id = '/ResultView';
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.predictDiagnosis();
    Future.delayed(const Duration(microseconds: 0), () async {
      showSlidingBottomSheet(context, builder: (context) {
        return SlidingSheetDialog(
            elevation: 8,
            cornerRadius: 32,
            minHeight: 686,
            builder: (context, state) {
              return Container(
                height: 686,
                width: 400,
                decoration: const BoxDecoration(
                  color: Color(0xffFAFAFA),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, right: 225),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: kRoboto,
                          color: kBlackColor,
                        ),
                        child: Text('Your Result is '),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 27, right: 210),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: kRoboto,
                          color: kBlackColor,
                        ),
                        child: Text('You may suffer from '),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 327,
                      height: 265,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xff0A0A0A).withOpacity(.12)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 21, top: 0, right: 0, bottom: 26),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            height: 1.5,
                            fontSize: 17,
                            color: Color(0xff979797),
                            fontFamily: kRoboto,
                          ),
                          child: ListView.separated(
                            itemCount: controller.diagnosis.length,
                            separatorBuilder: (context, index) => Divider(
                              color: const Color(0xff0A0A0A).withOpacity(.12),
                              thickness: 1,
                            ),
                            itemBuilder: (context, index) {
                              final String prediction =
                                  controller.diagnosis[index].prediction;
                              final String confidence =
                                  (controller.diagnosis[index].confidence * 100)
                                      .toStringAsFixed(2);
                              return Text(
                                "$prediction ($confidence%)",
                                style: const TextStyle(color: kBlackColor),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 49),
                    Obx(
                      () => CustomButton(
                        onTap: () {
                          controller.saveDiagnosisResult();
                        },
                        text: controller.isSaved
                            ? 'Saved successfully '
                            : 'Save your result',
                        size: 16,
                        width: 327,
                        height: 47,
                        color: controller.isSaved ? kThirdColor : kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor:
                            controller.isSaved ? kThirdColor : kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        onTap: () {
                          Get.offAll(const HomePage());
                        },
                        text: 'Go back home',
                        size: 16,
                        width: 327,
                        height: 47,
                        color: kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor: kPrimaryColor),
                    const SizedBox(height: 15),
                    CustomButton(
                        onTap: () {
                          Get.offUntil<BodyPartsView>(
                              MaterialPageRoute(
                                  builder: (context) => const BodyPartsView()),
                              (route) => route.isFirst);
                        },
                        text: 'Do another Diagnosis test ',
                        size: 16,
                        width: 327,
                        height: 47,
                        color: kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor: kPrimaryColor),
                    const SizedBox(height: 18),
                    CustomButton(
                        onTap: () {
                          Navigator.pop(context);
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
                        size: 16,
                        width: 327,
                        height: 47,
                        color: kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor: kPrimaryColor),
                  ],
                ),
              );
            });
      });
    });
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          const Text(
            'Diagnosis',
            style: TextStyle(
                fontSize: 24, fontFamily: kRoboto, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 42, bottom: 22),
            child: ProgressBar(
                ticks: 3,
                first1: true,
                second1: false,
                first2: true,
                second2: false,
                first3: true,
                second3: false),
          ),
        ],
      ),
    );
  }
}
