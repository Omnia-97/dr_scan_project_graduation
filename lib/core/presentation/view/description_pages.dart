import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:dr_scan_graduation_project/features/authentication/presentation/view/registration_intro_page.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/description_widget.dart';

class DescriptionPages extends StatelessWidget {
  DescriptionPages({Key? key}) : super(key: key);

  static String id = 'DescriptionPages';
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: controller,
        children: [
          DescriptionWidget(
            onpressed: () {
              Navigator.pop(context);
            },
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: nextPage()));
            },
            screenName: 'Diagnosis',
            buttonText: 'Next',
            screenImage: 'assets/images/diagonsis_dscription.gif',
            skipText: 'Skip',
            description:
                """The program takes care of the diagnosis by asking the patient some questions and helping him to find the part that he feel the pain on it, and through that it identifies the specialist doctor to treat him.""",
          ),
          DescriptionWidget(
            onpressed: () {
              Get.to(() => previousPage());
            },
            onTap: () {
              Get.to(() => const RegistrationIntroPage());
            },
            screenName: 'Medical Analysis',
            buttonText: 'Start',
            screenImage: 'assets/images/medical_analysis_dscription.gif',
            description:
                'The program reads the medical analysis easier and faster instead of going to the doctor. In each analysis translates the results continuously, thus saving time and effort for the patient and the consultant doctor.',
          ),
        ],
      ),
      Container(
        alignment: const Alignment(0, .93),
        child: SmoothPageIndicator(
          controller: controller,
          count: 2,
          effect: const ExpandingDotsEffect(
            activeDotColor: Color(0xff8A8A8A),
            spacing: 10,
            dotHeight: 10,
            dotWidth: 25,
            dotColor: Color(0xffD2D0C5),
          ),
        ),
      ),
    ]);
  }

  nextPage() {
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  previousPage() {
    controller.animateToPage(controller.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
