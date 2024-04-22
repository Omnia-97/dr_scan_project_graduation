import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/symptoms_view.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/body_part_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/nav_bar.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/progress_bar.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/utils/enums.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/bodyitem_page.dart';

class BodyPartsView extends GetWidget<BodyPartViewModel> {
  const BodyPartsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Get.to(() => const BodyItemPage()),
                  icon: const Icon(
                    FontAwesomeIcons.listDots,
                    color: Color(0xff3A3A3A),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 70),
                const Text(
                  'Diagnosis',
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: kRoboto,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 70),
                IconButton(
                  onPressed: () => controller.rotateBody(),
                  icon: const Icon(
                    FontAwesomeIcons.arrowRotateLeft,
                    color: Color(0xff3A3A3A),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 42, bottom: 22),
            child: ProgressBar(
              ticks: 3,
              first1: true,
              second1: false,
              first2: false,
              second2: false,
              first3: false,
              second3: false,
            ),
          ),
          const Text(
            """choose the part of the body that you
                   feel pain on it """,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: kRoboto,
                color: Color(0xff727272),
                fontSize: 15),
          ),
          Obx(() => _bodyWidget()),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 15),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.angleLeft,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                  const Text(
                    'Back',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontFamily: kRoboto,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 137),
                  CustomButton(
                    onTap: () {
                      Get.to(() =>
                          SymptomsView(bodyPart: controller.selectedBodyPart));
                    },
                    text: 'Next',
                    size: 16,
                    width: 124,
                    height: 47,
                    color: kPrimaryColor,
                    borderRadius: 10,
                    textColor: kWhiteColor,
                    borderColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavBar(
          istabbed2: true, istabbed: false, istabbed3: false, istabbed1: false),
    );
  }

  SizedBox _bodyWidget() {
    return SizedBox(
      height: 430,
      width: 500,
      child: Stack(
        children: [
          Image.asset(
            controller.isBackView
                ? 'assets/images/body_back.jpg'
                : 'assets/images/body.jpg',
            fit: BoxFit.fitHeight,
            width: 500,
            height: 430,
          ),
          Positioned(
            top: 14,
            left: 172,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.head),
              child: Image.asset(
                'assets/images/head.png',
                opacity: controller.getOpacity(BodyPart.head),
              ),
            ),
          ),
          Positioned(
            top: 79,
            left: 155,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.chest),
              child: Image.asset(
                'assets/images/chest.png',
                opacity: controller.getOpacity(BodyPart.chest),
              ),
            ),
          ),
          Positioned(
            top: 126,
            left: 160,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.abdomen),
              child: Image.asset(
                'assets/images/underchest.png',
                opacity: controller.getOpacity(BodyPart.abdomen),
              ),
            ),
          ),
          Positioned(
            top: 153,
            left: 163,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.abdomen),
              child: Image.asset(
                'assets/images/Abdomen.png',
                opacity: controller.getOpacity(BodyPart.abdomen),
              ),
            ),
          ),
          Positioned(
              top: 187,
              left: 159,
              child: InkWell(
                onTap: () => controller.selectBodyPart(BodyPart.pelvis),
                child: Image.asset(
                  'assets/images/Pelvis.png',
                  opacity: controller.getOpacity(BodyPart.pelvis),
                ),
              )),
          Positioned(
            top: 83,
            left: 234,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.arm),
              child: Image.asset(
                'assets/images/handupLeft.png',
                opacity: controller.getOpacity(BodyPart.arm),
              ),
            ),
          ),
          Positioned(
            top: 83,
            left: 115,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.arm),
              child: Image.asset(
                'assets/images/handupRight.png',
                opacity: controller.getOpacity(BodyPart.arm),
              ),
            ),
          ),
          Positioned(
              top: 125,
              left: 264,
              child: InkWell(
                onTap: () => controller.selectBodyPart(BodyPart.arm),
                child: Image.asset(
                  'assets/images/handbottomLeft.png',
                  opacity: controller.getOpacity(BodyPart.arm),
                ),
              )),
          Positioned(
              top: 125,
              left: 70,
              child: InkWell(
                onTap: () => controller.selectBodyPart(BodyPart.arm),
                child: Image.asset(
                  'assets/images/handbottomRight.png',
                  opacity: controller.getOpacity(BodyPart.arm),
                ),
              )),
          Positioned(
            top: 170,
            left: 318,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.arm),
              child: Image.asset(
                'assets/images/handLeft.png',
                opacity: controller.getOpacity(BodyPart.arm),
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 37,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.arm),
              child: Image.asset(
                'assets/images/handRight.png',
                opacity: controller.getOpacity(BodyPart.arm),
              ),
            ),
          ),
          Positioned(
            top: 231,
            left: 159,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.leg),
              child: InkWell(
                child: Image.asset(
                  'assets/images/legsup.png',
                  opacity: controller.getOpacity(BodyPart.leg),
                ),
              ),
            ),
          ),
          Positioned(
            top: 281,
            left: 163,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.leg),
              child: Image.asset(
                'assets/images/legsmed.png',
                opacity: controller.getOpacity(BodyPart.leg),
              ),
            ),
          ),
          Positioned(
            top: 307,
            left: 159,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.leg),
              child: Image.asset(
                'assets/images/legsbottom.png',
                opacity: controller.getOpacity(BodyPart.leg),
              ),
            ),
          ),
          Positioned(
            top: 377,
            left: 153,
            child: InkWell(
              onTap: () => controller.selectBodyPart(BodyPart.leg),
              child: Image.asset(
                'assets/images/foot.png',
                opacity: controller.getOpacity(BodyPart.leg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
