
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_sendcode.dart';
import 'package:flutter/material.dart';

class SendCodeMessage extends StatelessWidget {
  const SendCodeMessage({Key? key}) : super(key: key);
  static String id = 'SendCodeMessage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomSEndCode(image: 'assets/images/sendcode_mobile.png', text1: 'Check Your mobile phone', text2: '010123456789', ),
    );
  }
}
