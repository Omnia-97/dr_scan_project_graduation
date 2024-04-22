import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomIconSymptom extends StatelessWidget {
  const CustomIconSymptom({
    super.key,
    required this.icon,
    required this.iconText,
    required this.width,
    required this.height,
    required this.radius,
    required this.textcolor,
    required this.fontWeight,
    required this.borderColor,
    required this.iconcolor,
    required this.iconsize,
    this.onTap,
    required this.offset,
    required this.blurRadius,
    required this.shadowColor,
    required this.spreadRadius,
  });
  final Widget icon;
  final String iconText;
  final double width;
  final double height;
  final double radius;
  final Color textcolor;
  final FontWeight fontWeight;
  final Color borderColor;
  final Color iconcolor;
  final double iconsize;
  final void Function()? onTap;
  final Offset offset;
  final double blurRadius;
  final Color shadowColor;
  final double spreadRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: kWhiteColor.withOpacity(.8),
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                offset: offset,
                spreadRadius: spreadRadius,
              )
            ],
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: IconButton(
                  onPressed: onTap,
                  icon: icon,
                  color: iconcolor,
                  iconSize: iconsize,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    iconText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: kRoboto,
                        fontWeight: fontWeight,
                        color: textcolor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
