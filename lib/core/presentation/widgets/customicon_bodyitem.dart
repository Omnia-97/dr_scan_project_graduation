import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyItemContainer extends StatelessWidget {
  BodyItemContainer(
      {super.key,
      required this.image,
      required this.text,
      required this.width1,
      required this.width2,
      required this.width3,
      required this.width4,
      required this.ontap});
  var image;
  double width1;
  double width2;
  double width3;
  double width4;
  String text;
  var ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.25),
            offset: const Offset(0, 4),
          )
        ],
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 305,
      height: 51,
      child: Row(
        children: [
          SizedBox(
            width: width1,
          ),
          Image(image: image!),
          SizedBox(
            width: width2,
          ),
          Image.asset('assets/images/Linelist.png'),
          SizedBox(
            width: width3,
          ),
          Text(
            text,
            style: const TextStyle(
              height: 2,
              color: kWhiteColor,
              fontSize: 19,
              fontWeight: FontWeight.w600,
              fontFamily: kRoboto,
            ),
          ),
          SizedBox(
            width: width4,
          ),
          GestureDetector(
              onTap: ontap,
              child: Image.asset('assets/images/arrow-right.png')),
        ],
      ),
    );
  }
}
