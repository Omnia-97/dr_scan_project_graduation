import 'package:dr_scan_graduation_project/core/utils/enums.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class BodyPartViewModel extends GetxController {
  final _selectedBodyPart = Rx<BodyPart>(BodyPart.other);
  BodyPart get selectedBodyPart => _selectedBodyPart.value;

  final RxBool _isBackView = false.obs;
  bool get isBackView => _isBackView.value;

  void selectBodyPart(BodyPart bodyPart) {
    _selectedBodyPart.value = bodyPart;
  }

  void rotateBody() {
    _isBackView.value = !_isBackView.value;
  }

  Animation<double> getOpacity(BodyPart bodyPart) {
    if (bodyPart == _selectedBodyPart.value) {
      return const AlwaysStoppedAnimation(1.0);
    } else {
      return const AlwaysStoppedAnimation(0);
    }
  }
}
