import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/customicom_symptom.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/utils/enums.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/question_view.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/symptoms_view_model.dart';

class SymptomsView extends GetWidget<SymptomsViewModel> {
  const SymptomsView({
    super.key,
    required this.bodyPart,
  });
  final BodyPart bodyPart;

  @override
  Widget build(BuildContext context) {
    final String bodyPartName = bodyPart.toString().split('.').last.capitalize!;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 228,
            top: 114,
            child: Image.asset(
              'assets/images/background_body.png',
              width: 320,
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 80),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Color(0xff3A3A3A),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    '$bodyPartName Symptoms',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: kRoboto,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  'choose the part of that you feel\npain on it',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff727272),
                    fontFamily: kRoboto,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: GetBuilder(
                      init: controller,
                      initState: (_) => controller.getSymptoms(bodyPart),
                      builder: (controller) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.symptoms.length,
                          itemBuilder: (context, index) {
                            return CustomIconSymptom(
                              spreadRadius: 0,
                              shadowColor: kBlackColor.withOpacity(.25),
                              blurRadius: 13,
                              offset: const Offset(0, 1),
                              onTap: () => controller.toggleSelection(index),
                              icon: controller.symptoms[index].isSelected
                                  ? const Icon(FontAwesomeIcons.checkCircle)
                                  : const Icon(FontAwesomeIcons.circle),
                              iconText: controller.symptoms[index].name,
                              width: 300,
                              height: 44,
                              radius: 13,
                              textcolor: kBlackColor,
                              borderColor: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              iconcolor: kBlackColor,
                              iconsize: 21,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => Get.to(() => const QuestionView()),
                child: CustomButton(
                  text: 'Next',
                  size: 16,
                  width: 310,
                  height: 47,
                  color: kPrimaryColor,
                  borderRadius: 10,
                  textColor: kWhiteColor,
                  borderColor: kPrimaryColor,
                  fontweight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ],
      ),
    );
  }
}
