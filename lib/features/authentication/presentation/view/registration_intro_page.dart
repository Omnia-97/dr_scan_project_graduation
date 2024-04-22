import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:text_divider/text_divider.dart';

import 'package:dr_scan_graduation_project/features/authentication/presentation/view/login_page.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view/signup_page.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view/skip_registration_page.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/customicon_button.dart';

class RegistrationIntroPage extends StatefulWidget {
  const RegistrationIntroPage({Key? key}) : super(key: key);
  static String id = 'RegistrationIntroPage';

  @override
  State<RegistrationIntroPage> createState() => _RegistrationIntroPageState();
}

class _RegistrationIntroPageState extends State<RegistrationIntroPage> {
  bool isSign = false;

  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(children: [
        Positioned(top: 10, child: Image.asset('assets/images/Union.png')),
        Positioned(
          top: 100,
          child: Image.asset(
            'assets/images/first_registration.gif',
            width: 420,
            height: 420,
          ),
        ),
        Positioned(top: 100, child: Image.asset('assets/images/Union.png')),
        Column(
          children: [
            const SizedBox(
              height: 500,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  isLogin = true;
                });
                Get.to(() => LoginPage());
              },
              text: 'Log-In',
              size: 20,
              width: 295,
              height: 45,
              color: isLogin ? const Color(0xff027189) : kPrimaryColor,
              borderRadius: 8,
              fontweight: FontWeight.w500,
              textColor: kWhiteColor,
              borderColor: kPrimaryColor,
            ),
            const SizedBox(
              height: 18,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  isSign = true;
                });
                Get.off(() => SignUpPage());
              },
              text: 'Sign-Up',
              size: 20,
              width: 295,
              height: 45,
              color: isSign ? const Color(0xffA5B3B6) : const Color(0xffB6CED3),
              borderRadius: 8,
              fontweight: FontWeight.w500,
              textColor: kWhiteColor,
              borderColor:
                  isSign ? const Color(0xffA5B3B6) : const Color(0xffB6CED3),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 41),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: Logo(
                      Logos.google,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomIconButton(
                      icon: const Icon(
                    Icons.facebook,
                    color: Color(0xff1778F2),
                    size: 30,
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: TextDivider.horizontal(
                    text: const Text(
                      ' OR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: kRoboto,
                      ),
                    ),
                    thickness: 1,
                    color: const Color(0xff565656),
                    indent: 8,
                    endIndent: 8)),
            Padding(
              padding: const EdgeInsets.only(left: 85, right: 60, top: 25),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      barrierColor: const Color(0xff2C2C2C).withOpacity(.5),
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: CupertinoAlertDialog(
                            title: const Center(
                              child: Text(
                                'Dear User',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: kRoboto,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            content: const Text(
                              """If you continue without registration , you will lose some of features , So we recommend logining for you.""",
                              style: TextStyle(
                                  color: Color(0xff6B6B6B),
                                  fontSize: 16,
                                  fontFamily: kRoboto,
                                  fontWeight: FontWeight.w500),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                  onPressed: () {
                                    Get.to(() => SkipRegistrationPage());
                                  },
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontFamily: kRoboto,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  )),
                              CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontFamily: kRoboto,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ))
                            ],
                          ),
                        );
                      });
                },
                child: const Row(
                  children: [
                    Text(
                      'Continue Without ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: kRoboto,
                          color: kGreyColor),
                    ),
                    Text(
                      'Registeration',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: kRoboto,
                        color: kGreyColor,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
