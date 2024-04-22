import 'package:dr_scan_graduation_project/core/presentation/view/description_pages.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 95,
            ),
            const Text(
              'About',
              style: TextStyle(
                  fontFamily: kRoboto, fontSize: 24, color: Color(0xff525252)),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Dr.Scan',
              style: TextStyle(
                  fontFamily: 'Lora', fontSize: 32, color: Color(0xff222222)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Center(
                child: Text(
                  'DR.Scan app provide medical diagnosis and understanding medical tests. Dr.Scan services can always be used. By using our services you can save money and effort.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff434242),
                      fontFamily: kRoboto,
                      height: 1.7),
                ),
              ),
            ),
            const SizedBox(
              height: 62,
            ),
            Image.asset(
              'assets/images/aboutus_description.gif',
              width: 350,
            ),
            const SizedBox(
              height: 13,
            ),
            CustomButton(
              borderRadius: 8,
              color: kPrimaryColor,
              width: 320,
              height: 40,
              onTap: () {
                Get.to(() => DescriptionPages());
              },
              text: 'Get started !',
              size: 18,
              textColor: kWhiteColor,
              borderColor: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
