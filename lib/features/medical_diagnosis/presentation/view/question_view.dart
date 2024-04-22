import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/nav_bar.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/progress_bar.dart';
import 'package:dr_scan_graduation_project/core/utils/binding.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/question_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/loading_page.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/diagnosis_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/questions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class QuestionView extends GetWidget<DiagnosisViewModel> {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 90),
          const Text(
            'Diagnosis',
            style: TextStyle(
              fontSize: 24,
              fontFamily: kRoboto,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 42, bottom: 22),
            child: ProgressBar(
                ticks: 3,
                first1: true,
                second1: false,
                first2: true,
                second2: false,
                first3: false,
                second3: false),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              """Please answer these Questions to            
                get accurate info ..""",
              style: TextStyle(
                color: Color(0xff818181),
                fontSize: 15,
                fontFamily: kRoboto,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Column(
            children: [
              const SizedBox(height: 16),
              GetBuilder<QuestionsViewModel>(
                init: sl<QuestionsViewModel>(),
                initState: (_) {},
                builder: (questionsController) {
                  return SizedBox(
                    height: 370,
                    width: 366,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      controller: controller.pageController,
                      itemCount: questionsController.questions.length,
                      itemBuilder: (context, index) {
                        final int currentIndex = index + 1;
                        final QuestionModel question =
                            questionsController.questions[index];
                        return PageViewCard(
                          index: currentIndex,
                          question: question,
                          controller: controller,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (controller.pageController.page == 0) {
                    Get.back();
                  } else {
                    controller.previousPage();
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 40, top: 35),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.angleLeft,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontFamily: kRoboto,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 119),
                child: CustomButton(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // context = context;
                          return const LoadingPage();
                        },
                      );
                    },
                    text: 'Next',
                    size: 16,
                    width: 124,
                    height: 47,
                    color: kPrimaryColor,
                    borderRadius: 12,
                    textColor: kWhiteColor,
                    borderColor: kPrimaryColor),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        istabbed2: true,
        istabbed: false,
        istabbed3: false,
        istabbed1: false,
      ),
    );
  }
}

class PageViewCard extends StatelessWidget {
  const PageViewCard({
    super.key,
    required this.index,
    required this.question,
    required this.controller,
  });
  final int index;
  final DiagnosisViewModel controller;
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(.1),
            blurRadius: 15,
            spreadRadius: 3,
            offset: const Offset(0, 0),
          )
        ],
        borderRadius: BorderRadius.circular(16),
        color: kWhiteColor,
      ),
      margin: const EdgeInsets.only(left: 14, right: 14),
      child: Column(
        children: [
          const SizedBox(height: 29),
          Text(
            '$index/3',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: kRoboto,
              color: Color(0xff818181),
            ),
          ),
          // const SizedBox(height: 31),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Center(
              child: Text(
                question.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: kRoboto,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Yes',
            onTap: () => controller.nextPage(question.symptom, true),
            size: 16,
            width: 269,
            height: 47,
            color: kPrimaryColor,
            borderRadius: 16,
            fontweight: FontWeight.w400,
            textColor: kWhiteColor,
            borderColor: kPrimaryColor,
          ),
          const SizedBox(height: 18),
          CustomButton(
            text: 'No',
            onTap: () => controller.nextPage(question.symptom, false),
            size: 16,
            width: 269,
            height: 47,
            color: kPrimaryColor,
            borderRadius: 16,
            fontweight: FontWeight.w400,
            textColor: kWhiteColor,
            borderColor: kPrimaryColor,
          ),
          const SizedBox(height: 18),
          CustomButton(
            text: 'Don’t Know',
            onTap: () => controller.nextPage(question.symptom, false),
            size: 16,
            width: 269,
            height: 47,
            color: kPrimaryColor,
            borderRadius: 16,
            fontweight: FontWeight.w400,
            textColor: kWhiteColor,
            borderColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
