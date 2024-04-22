import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/nav_bar.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/progress_bar.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/bpdy_parts_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MedicalDiagnosisPage extends StatefulWidget {
  const MedicalDiagnosisPage({Key? key}) : super(key: key);
  static String id = 'MedicalDiagnosisPage';

  @override
  State<MedicalDiagnosisPage> createState() => _MedicalDiagnosisPageState();
}

class _MedicalDiagnosisPageState extends State<MedicalDiagnosisPage> {
  bool mySelf = false;
  bool others = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(children: [
        Positioned(
          top: 294,
          width: 400,
          height: 400,
          child: Image.asset('assets/images/yes or no.gif'),
        ),
        Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            const Center(
              child: Text(
                'Diagnosis',
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: kRoboto,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27, left: 42, bottom: 30),
              child: ProgressBar(
                ticks: 3,
                first1: false,
                second1: false,
                first2: false,
                second2: false,
                first3: false,
                second3: false,
              ),
            ),
            const Text(
              '  For Who ?',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: kRoboto,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          mySelf = true;
                          others = false;
                        });
                      },
                      child: Container(
                        width: 134,
                        height: 134,
                        decoration: BoxDecoration(
                          boxShadow: [
                            mySelf
                                ? BoxShadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 11,
                                    spreadRadius: 5,
                                    color: const Color(0xff0E5C6D)
                                        .withOpacity(.15),
                                  )
                                : BoxShadow(
                                    offset: const Offset(0, 1),
                                    spreadRadius: 0,
                                    blurRadius: 7,
                                    color:
                                        const Color(0xff3D5B59).withOpacity(.3),
                                  )
                          ],
                          color: kWhiteColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 88),
                              child: mySelf
                                  ? const Icon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kPrimaryColor,
                                      size: 20,
                                    )
                                  : null,
                            ),
                            mySelf
                                ? const SizedBox(
                                    height: 4,
                                  )
                                : const SizedBox(
                                    height: 24,
                                  ),
                            Image.asset('assets/images/myself.png'),
                            mySelf
                                ? const SizedBox(
                                    height: 12,
                                  )
                                : const SizedBox(
                                    height: 12,
                                  ),
                            const Text(
                              'For me',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: kRoboto,
                                  fontSize: 15),
                            ),
                            mySelf
                                ? const SizedBox(
                                    height: 12,
                                  )
                                : const SizedBox(
                                    height: 12,
                                  )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset('assets/images/Line.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          others = true;
                          mySelf = false;
                        });
                      },
                      child: Container(
                        width: 134,
                        height: 134,
                        decoration: BoxDecoration(
                            boxShadow: [
                              others
                                  ? BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 11,
                                      spreadRadius: 5,
                                      color: const Color(0xff0E5C6D)
                                          .withOpacity(.15))
                                  : BoxShadow(
                                      offset: const Offset(0, 1),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      color: const Color(0xff3D5B59)
                                          .withOpacity(.3))
                            ],
                            color: kWhiteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 88),
                              child: others
                                  ? const Icon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kPrimaryColor,
                                      size: 20,
                                    )
                                  : null,
                            ),
                            others
                                ? const SizedBox(
                                    height: 4,
                                  )
                                : const SizedBox(
                                    height: 24,
                                  ),
                            Image.asset('assets/images/others.png'),
                            others
                                ? const SizedBox(
                                    height: 12,
                                  )
                                : const SizedBox(
                                    height: 12,
                                  ),
                            const Text(
                              'For others',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: kRoboto,
                                  fontSize: 15),
                            ),
                            others
                                ? const SizedBox(
                                    height: 12,
                                  )
                                : const SizedBox(
                                    height: 12,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 248),
              child: GestureDetector(
                onTap: () {
                  if (mySelf || others) {
                    Get.to(() => const BodyPartsView());
                  }
                },
                child: Container(
                  width: 293,
                  height: 47,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: mySelf || others
                      ? const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: kWhiteColor,
                                fontFamily: kRoboto,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: NavBar(
        istabbed2: true,
        istabbed: false,
        istabbed3: false,
        istabbed1: false,
      ),
    );
  }
}
