import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.color,
    this.hintText,
    this.onChanged,
    this.controller,
    required this.width,
    required this.padding,
    required this.abovetext,
    required this.suffixIcon,
  });
  final Color? color;
  final double width;
  final double padding;
  final String abovetext;
  final String? hintText;
  final Widget suffixIcon;
  final Function(String)? onChanged;
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
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            controller: controller,
            cursorColor: const Color(0xff5F5F5F),
            validator: (data) {
              if (data!.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: color,
              hintText: hintText,
              hintStyle: const TextStyle(color: kGreyColor),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: suffixIcon,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD8DADC),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
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
