import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:text_divider/text_divider.dart';

import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_field.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_formfield.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/customicon_text.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view/forgetpassword_page.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view/signup_page.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view_model/auth_view_model.dart';

import 'skip_registration_page.dart';

class LoginPage extends GetWidget<AuthViewModel> {
  const LoginPage({Key? key}) : super(key: key);
  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // Positioned(
        //   top: 50,left: 15,
        //
        //     child: Image.asset('assets/images/Union.png')),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Log in',
                      style: TextStyle(
                          fontFamily: kRoboto,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 18),
                child: Text(
                  'Hello, welcome back to your account',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff888888),
                      fontFamily: kRoboto,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                controller: controller.emailController,
                abovetext: 'Email address',
                hintText: 'ex.Email@gmail.com',
                width: 350,
                padding: 250,
              ),
              const SizedBox(
                height: 39,
              ),
              CustomTextFormField(
                controller: controller.passwordController,
                padding: 275,
                hintText: 'Enter password',
                suffixIcon: const Icon(
                  Icons.visibility_off_outlined,
                ),
                abovetext: 'Password',
                width: 350,
                color: kWhiteColor,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Icon(
                    Icons.check_circle_sharp,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontSize: 14, fontFamily: kRoboto),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => ForgetPasswordPage());
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: kRoboto,
                            color: Colors.black),
                      )),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Obx(() => CustomButton(
                      onTap: () async {
                        await controller.login();
                      },
                      text: 'Log-In',
                      size: 20,
                      width: 295,
                      height: 45,
                      color: controller.isLogin.value
                          ? const Color(0xff027189)
                          : kPrimaryColor,
                      borderRadius: 8,
                      fontweight: FontWeight.w500,
                      textColor: kWhiteColor,
                      borderColor: controller.isLogin.value
                          ? const Color(0xff027189)
                          : kPrimaryColor,
                    )),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 23),
                child: TextDivider.horizontal(
                    text: const Text(
                      '  OR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: kRoboto,
                      ),
                    ),
                    thickness: 1,
                    color: const Color(0xff565656),
                    indent: 8,
                    endIndent: 8),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () async {
                  UserCredential cred = await controller.signInWithGoogle();
                  Get.to(() => SkipRegistrationPage());
                },
                child: CustomIconText(
                    icon: Logo(
                      Logos.google,
                      size: 24,
                    ),
                    iconText: 'Login with Google'),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await controller.signInWithFacebook();
                  Get.to(() => SkipRegistrationPage());
                },
                child: CustomIconText(
                    icon: const Icon(
                      Icons.facebook,
                      color: Color(0xff1778F2),
                      size: 30,
                    ),
                    iconText: 'Login with Facebook'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 85,
                  right: 60,
                  top: 31,
                  bottom: 25,
                ),
                child: Row(
                  children: [
                    const Text(
                      'Don’t have an account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: kRoboto,
                          color: Color(0xff474747)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SignUpPage());
                      },
                      child: const Text(
                        'Sign-up',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: kRoboto,
                          color: Color(0xff474747),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
