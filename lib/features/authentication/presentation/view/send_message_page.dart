import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dr_scan_graduation_project/features/authentication/presentation/view/login_page.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view/send_code_message.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class SendMessagePage extends StatelessWidget {
  const SendMessagePage({Key? key}) : super(key: key);
  static String id = 'SendMessagePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        children: [
          Positioned(top: 10, child: Image.asset('assets/images/Union.png')),
          ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 310),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeftLong,
                      color: kPrimaryColor,
                    )),
              ),
              Center(child: Image.asset('assets/images/forget_password.png')),
              const SizedBox(
                height: 22,
              ),
              const Center(
                child: Text(
                  'Forget Password ?',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: kRoboto),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Center(
                child: Text(
                  """      Don’t worry! It happens. Please enter the 
   phone number associated with your account. """,
                  style: TextStyle(
                      fontSize: 15,
                      color: kBlackColor.withOpacity(.7),
                      fontWeight: FontWeight.w400,
                      fontFamily: kRoboto),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 21),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      keyboard: TextInputType.number,
                      abovetext: 'Country code',
                      hintText: '+20',
                      width: 122,
                      padding: 21,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    CustomTextField(
                      keyboard: TextInputType.number,
                      padding: 106,
                      abovetext: 'Mobile number',
                      hintText: '1094078360',
                      width: 217,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(SendCodeMessage.id);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: CustomButton(
                    text: 'Send code',
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
              ),
              const SizedBox(
                height: 125,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  children: [
                    Text(
                      'Remember password? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontFamily: kRoboto,
                          color: kBlackColor.withOpacity(.7)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(LoginPage.id);
                      },
                      child: const Text(
                        ' Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: kRoboto,
                          color: kBlackColor,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
