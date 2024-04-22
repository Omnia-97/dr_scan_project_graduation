
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_sendcode.dart';
import 'package:flutter/material.dart';

class SendCodeEmail extends StatelessWidget {
  const SendCodeEmail({Key? key}) : super(key: key);
  static String id = 'SendCodeEmail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomSEndCode(image: 'assets/images/sendcode_email.png', text1: 'Check Your Email', text2: 'Laraalaa22@gmail.com', ),
    );
  }
}
