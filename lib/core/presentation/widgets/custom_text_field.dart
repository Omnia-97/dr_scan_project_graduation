import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.abovetext,
    required this.hintText,
    required this.width,
    required this.padding,
    this.controller,
    this.keyboard,
  });
  final String abovetext;
  final String hintText;
  final double width;
  final double padding;
  final TextInputType? keyboard;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: padding),
          child: Text(
            abovetext,
            style: const TextStyle(
                fontFamily: kRoboto, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: width,
          child: TextField(
            controller: controller,
            keyboardType: keyboard,
            cursorColor: const Color(0xff5F5F5F),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD8DADC),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: kGreyColor),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD8DADC),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
