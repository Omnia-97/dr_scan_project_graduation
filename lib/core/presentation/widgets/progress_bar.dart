import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressBar extends StatelessWidget {
  int ticks;
  bool first1;
  bool second1;
  bool first2;
  bool second2;
  bool first3;
  bool second3;

  ProgressBar(
      {super.key,
      required this.ticks,
      required this.first1,
      required this.second1,
      required this.first2,
      required this.second2,
      required this.first3,
      required this.second3});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        tick1(),
        spacer(),
        line(),
        spacer(),
        tick2(),
        spacer(),
        line(),
        spacer(),
        tick3(),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? const Icon(
            FontAwesomeIcons.solidCircleCheck,
            color: kPrimaryColor,
            size: 20,
          )
        : const Icon(
            FontAwesomeIcons.circle,
            color: kPrimaryColor,
            size: 18,
          );
  }

  Widget tick1() {
    return ticks > 0 ? tick(first1) : tick(second1);
  }

  Widget tick2() {
    return ticks > 1 ? tick(first2) : tick(second2);
  }

  Widget tick3() {
    return ticks > 2 ? tick(first3) : tick(second3);
  }

  Widget spacer() {
    return Container(
      width: 20,
    );
  }

  Widget line() {
    return Container(
      color: kPrimaryColor,
      height: 1,
      width: 85,
    );
  }
}
