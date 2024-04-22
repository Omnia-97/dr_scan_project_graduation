import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_field.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({Key? key}) : super(key: key);
  static String id = 'AccountInfoPage';

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
                    top: 90,
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
                  width: 80,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 82),
                  child: Text(
                    'Account Info',
                    style: TextStyle(
                        fontFamily: kRoboto,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 156,
              left: 24,
              child: CustomTextFormField(
                padding: 270,
                suffixIcon: FaIcon(
                  FontAwesomeIcons.userEdit,
                  color: kPrimaryColor,
                  size: 22,
                ),
                abovetext: 'Your name',
                width: 350,
                hintText: 'ex. DR.Scan user',
              ),
            ),
            const Positioned(
              top: 263,
              left: 24,
              child: CustomTextFormField(
                suffixIcon: Icon(
                  FontAwesomeIcons.calendarAlt,
                  color: kPrimaryColor,
                  size: 24,
                ),
                abovetext: 'Age',
                width: 350,
                padding: 308,
                hintText: 'dd/mm/yy',
              ),
            ),
            const Positioned(
              top: 373,
              left: 24,
              child: CustomTextField(
                  abovetext: 'Do you suffer from any disease ?',
                  hintText: 'ex. I suffer from diabetes ...',
                  width: 350,
                  padding: 125),
            ),
            const Positioned(
              top: 483,
              left: 31,
              child: Text(
                'Gender',
                style: TextStyle(
                    fontFamily: kRoboto,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              top: 512,
              left: 45,
              child: Row(
                children: [
                  CustomButton(
                    text: 'Female',
                    size: 14,
                    width: 148,
                    height: 40,
                    color: kWhiteColor,
                    borderRadius: 8,
                    textColor: kGreyColor,
                    borderColor: const Color(0xff768384),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomButton(
                    text: 'Male',
                    size: 14,
                    width: 148,
                    height: 40,
                    color: Colors.white,
                    borderRadius: 8,
                    textColor: kGreyColor,
                    borderColor: const Color(0xff768384),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
