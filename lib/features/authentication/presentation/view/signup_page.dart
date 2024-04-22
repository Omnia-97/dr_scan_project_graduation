import 'package:dr_scan_graduation_project/core/presentation/view/home_page.dart';
import 'package:dr_scan_graduation_project/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:text_divider/text_divider.dart';

import 'package:dr_scan_graduation_project/features/authentication/presentation/view/login_page.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view_model/auth_view_model.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_field.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_formfield.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/customicon_text.dart';

class SignUpPage extends GetWidget<AuthViewModel> {
  const SignUpPage({Key? key}) : super(key: key);
  static String id = 'SignupPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 110),
        child: SafeArea(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(FontAwesomeIcons.arrowLeft,
                      color: Colors.black, size: 20),
                ),
              ),
              const SizedBox(width: 18),
              Container(
                height: 120,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'Create account',
                    style: TextStyle(
                        fontFamily: kRoboto,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: controller.userNameController,
            color: kWhiteColor,
            padding: 270,
            suffixIcon: const FaIcon(FontAwesomeIcons.userPen,
                color: kPrimaryColor, size: 22),
            abovetext: 'User Name',
            width: 350,
            hintText: 'ex. DR.Scan user',
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            controller: controller.emailController,
            color: kWhiteColor,
            padding: 253,
            suffixIcon: const Icon(Icons.email_outlined,
                color: kPrimaryColor, size: 26),
            abovetext: 'Email address',
            width: 350,
            hintText: 'Your email',
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                    controller: controller.countryCodeController,
                    abovetext: 'Country code',
                    hintText: '+20',
                    width: 122,
                    padding: 21),
                const SizedBox(width: 11),
                CustomTextField(
                  controller: controller.phoneController,
                  padding: 106,
                  abovetext: 'Mobile number',
                  hintText: '1094078360',
                  width: 217,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            controller: controller.passwordController,
            color: kWhiteColor,
            padding: 278,
            hintText: 'Enter password',
            suffixIcon: const Icon(Icons.visibility_off_outlined,
                color: kPrimaryColor, size: 24),
            abovetext: 'Password',
            width: 350,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
              controller: controller.confirmPasswordController,
              color: kWhiteColor,
              padding: 221,
              hintText: 'Enter password again',
              suffixIcon: const Icon(Icons.visibility_off_outlined,
                  color: kPrimaryColor, size: 24),
              abovetext: 'Confirm Password',
              width: 350),
          const SizedBox(height: 30),
          CustomTextFormField(
            controller: controller.birthDateController,
            color: kWhiteColor,
            suffixIcon: const Icon(FontAwesomeIcons.calendarDays,
                color: kPrimaryColor, size: 24),
            abovetext: 'Age',
            width: 350,
            padding: 308,
            hintText: 'dd/mm/yy',
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 27),
            child: Text(
              'Gender',
              style: TextStyle(
                  fontFamily: kRoboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Obx(() => Row(
                  children: [
                    CustomButton(
                      onTap: () => controller.selectFemale(),
                      text: 'Female',
                      size: 14,
                      width: 148,
                      height: 40,
                      color: kWhiteColor,
                      borderRadius: 8,
                      textColor:
                          controller.selectedGender.value == Gender.female
                              ? kPrimaryColor
                              : kBlackColor.withOpacity(.6),
                      borderColor:
                          controller.selectedGender.value == Gender.female
                              ? kPrimaryColor
                              : const Color(0xff768384),
                      fontweight:
                          controller.selectedGender.value == Gender.female
                              ? FontWeight.w600
                              : FontWeight.w400,
                    ),
                    const SizedBox(width: 24),
                    CustomButton(
                      onTap: () => controller.selectMale(),
                      text: 'Male',
                      size: 14,
                      width: 148,
                      height: 40,
                      color: Colors.white,
                      borderRadius: 8,
                      textColor: controller.selectedGender.value == Gender.male
                          ? kPrimaryColor
                          : kBlackColor.withOpacity(.6),
                      borderColor:
                          controller.selectedGender.value == Gender.male
                              ? kPrimaryColor
                              : const Color(0xff768384),
                      fontweight: controller.selectedGender.value == Gender.male
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 27),
            child: Text(
              'Do you smoke cigarette?',
              style: TextStyle(
                  fontFamily: kRoboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Obx(() => Row(
                  children: [
                    CustomButton(
                      onTap: () => controller.isSmoker.value = true,
                      text: 'Yes',
                      size: 14,
                      width: 148,
                      height: 40,
                      color: kWhiteColor,
                      borderRadius: 8,
                      textColor: controller.isSmoker.value == true
                          ? kPrimaryColor
                          : kBlackColor.withOpacity(.6),
                      borderColor: controller.isSmoker.value == true
                          ? kPrimaryColor
                          : const Color(0xff768384),
                      fontweight: controller.isSmoker.value == true
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomButton(
                      onTap: () => controller.isSmoker.value = false,
                      text: 'No',
                      size: 14,
                      width: 148,
                      height: 40,
                      color: Colors.white,
                      borderRadius: 8,
                      textColor: controller.isSmoker.value == false
                          ? kPrimaryColor
                          : kBlackColor.withOpacity(.6),
                      borderColor: controller.isSmoker.value == false
                          ? kPrimaryColor
                          : const Color(0xff768384),
                      fontweight: controller.isSmoker.value == false
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 30),
          CustomTextField(
              controller: controller.diseaseController,
              abovetext: 'Do you suffer from any disease ?',
              hintText: 'ex. I suffer from diabetes ...',
              width: 350,
              padding: 125),
          const SizedBox(height: 40),
          Center(
            child: CustomButton(
              onTap: () {
                controller.signUp();
              },
              text: 'Sign-Up',
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
            ),
          ),
          const SizedBox(height: 28),
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
          const SizedBox(height: 25),
          CustomIconText(
              icon: Logo(Logos.google, size: 24),
              iconText: 'Sign up with Google'),
          const SizedBox(height: 20),
          CustomIconText(
              icon: const Icon(Icons.facebook,
                  color: Color(0xff1778F2), size: 30),
              iconText: 'Sign up with Facebook'),
          Padding(
            padding:
                const EdgeInsets.only(left: 85, right: 60, top: 31, bottom: 25),
            child: Row(
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: kRoboto,
                      color: Color(0xff474747)),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const LoginPage());
                  },
                  child: const Text(
                    'Log-in',
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
    );
  }
}
