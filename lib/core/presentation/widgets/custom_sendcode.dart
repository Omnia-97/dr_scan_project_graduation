import 'package:dr_scan_graduation_project/features/authentication/presentation/view/reset_password_page.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomSEndCode extends StatefulWidget {
  CustomSEndCode(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2});
  String image;
  String text1;
  String text2;

  @override
  State<CustomSEndCode> createState() => _CustomSEndCodeState();
}

class _CustomSEndCodeState extends State<CustomSEndCode> {
  bool isSumbit = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            Center(child: Image.asset(widget.image)),
            const SizedBox(
              height: 22,
            ),
            Center(
              child: Text(
                widget.text1,
                style: const TextStyle(
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
                'We’ve sent a code to ',
                style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor.withOpacity(.7),
                    fontWeight: FontWeight.w400,
                    fontFamily: kRoboto),
              ),
            ),
            Center(
              child: Text(
                widget.text2,
                style: const TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: kRoboto),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF6F6F6),
                          border: Border.all(
                              width: 5, color: const Color(0xffF6F6F6)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: kBlackColor.withOpacity(.12),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: const Offset(2, 2))
                          ]),
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        cursorColor: const Color(0xff5F5F5F),
                        cursorWidth: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: kRoboto,
                            fontWeight: FontWeight.w500,
                            fontSize: 32),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          focusColor: Color(0xff5F5F5F),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF6F6F6),
                          border: Border.all(
                              width: 5, color: const Color(0xffF6F6F6)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: kBlackColor.withOpacity(.12),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: const Offset(2, 2))
                          ]),
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        cursorColor: const Color(0xff5F5F5F),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: kRoboto,
                            fontWeight: FontWeight.w500,
                            fontSize: 32),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF6F6F6),
                          border: Border.all(
                              width: 5, color: const Color(0xffF6F6F6)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: kBlackColor.withOpacity(.12),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: const Offset(2, 2))
                          ]),
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        cursorColor: const Color(0xff5F5F5F),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: kRoboto,
                            fontWeight: FontWeight.w500,
                            fontSize: 32),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF6F6F6),
                          border: Border.all(
                              width: 5, color: const Color(0xffF6F6F6)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: kBlackColor.withOpacity(.12),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: const Offset(2, 2))
                          ]),
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        // onFieldSubmitted: (e){setState(() {
                        //   isSumbit = true;                        });},
                        cursorColor: const Color(0xff5F5F5F),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: kRoboto,
                            fontWeight: FontWeight.w500,
                            fontSize: 32),
                        onChanged: (value) {
                          setState(() {
                            isSumbit = true;
                          });
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  Text(
                    'I didn’t receive a code ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: kRoboto,
                        color: kBlackColor.withOpacity(.7)),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      '  Resend',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: kRoboto,
                        color: kBlackColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Center(
              child: Text(
                'Next',
                style: TextStyle(
                    color: kWhiteColor,
                    fontFamily: kRoboto,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            isSumbit
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ResetPasswordPage());
                      },
                      child: CustomButton(
                        text: 'Verify',
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
                  )
                : const Text(''),
          ],
        )
      ],
    );
  }
}
