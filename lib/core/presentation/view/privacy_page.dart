import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_field.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_formfield.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/customicon_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);
  static String id = 'PrivacyPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Stack(
        children: [
          Image.asset('assets/images/Union.png'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                  top: 70,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 67),
                child: Text(
                  'Privacy',
                  style: TextStyle(
                      fontFamily: kRoboto,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          const Positioned(
            top: 146,
            left: 24,
            child: CustomTextFormField(
              color: kWhiteColor,
              padding: 253,
              suffixIcon: Icon(
                Icons.email_outlined,
                color: kPrimaryColor,
                size: 26,
              ),
              abovetext: 'Email address',
              width: 350,
              hintText: 'Your email',
            ),
          ),
          const Positioned(
            left: 21,
            top: 256,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  abovetext: 'Country code',
                  hintText: '+20',
                  width: 122,
                  padding: 21,
                ),
                SizedBox(
                  width: 11,
                ),
                CustomTextField(
                  padding: 106,
                  abovetext: 'Mobile number',
                  hintText: '1094078360',
                  width: 217,
                )
              ],
            ),
          ),
          const Positioned(
            left: 24,
            top: 368,
            child: CustomTextFormField(
              color: kWhiteColor,
              padding: 278,
              hintText: '*********',
              suffixIcon: Icon(
                Icons.visibility_off_outlined,
                color: kPrimaryColor,
                size: 24,
              ),
              abovetext: 'Password',
              width: 350,
            ),
          ),
          Positioned(
            top: 480,
            left: 2,
            child: CustomIconText(
                icon: Logo(
                  Logos.google,
                  size: 24,
                ),
                iconText: 'Add your Google email'),
          ),
          Positioned(
            top: 555,
            left: 2,
            child: CustomIconText(
                icon: const Icon(
                  Icons.facebook,
                  color: Color(0xff1778F2),
                  size: 30,
                ),
                iconText: 'Sign up with Facebook'),
          ),
        ],
      ),
    );
  }
}
