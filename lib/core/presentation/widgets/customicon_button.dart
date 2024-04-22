import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({super.key, required this.icon});
  Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 137,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 13,
              offset: const Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: icon,
          ),
        ));
  }
}
