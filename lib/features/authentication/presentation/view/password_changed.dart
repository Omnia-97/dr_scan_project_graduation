import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({Key? key}) : super(key: key);
  static String id = 'PasswordChangedPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 168,
          ),
          Center(child: Image.asset('assets/images/password_changed.png')),
          const SizedBox(
            height: 48,
          ),
          const Center(
            child: Text(
              'Password changed',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor,
                  fontFamily: kRoboto),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              """Your password has been changed
                  successfully""",
              style: TextStyle(
                  fontSize: 16,
                  color: kWhiteColor.withOpacity(.8),
                  fontWeight: FontWeight.w400,
                  fontFamily: kRoboto),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: GestureDetector(
              onTap: () {
                Get.to(() => LoginPage());
              },
              child: CustomButton(
                text: 'Go back to login',
                size: 16,
                width: 310,
                height: 47,
                color: kWhiteColor,
                borderRadius: 10,
                textColor: const Color(0xff496664),
                borderColor: kWhiteColor,
                fontweight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
